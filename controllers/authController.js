const bcrypt = require("bcryptjs");
const crypto = require("crypto");
const User = require("../models/User");
const {generateToken} = require("../utils/utils");

const config = require("../config/config.js");
const Email = require("../services/mailService");

const register = async (req, res) => {
  const { firstName, lastName, email, password } = req.body;

  try {
    const existingUser = await User.findOne({ email });
    if (existingUser)
      return res.status(400).json({ message: "User already exists" });

    const user = await User.create({
      firstName,
      lastName,
      email,
      password,
      role: "patient",       // default users are patients
      status: "active",      // default status is active for patients
    });

    const token = generateToken(user._id, user.role); 

    res.status(201).json({
      "user":user,
      "token":token,
      "expiresIn": config.TOKEN_TIMEOUT,
      "message": "Registration successful"
    });

  } catch (error) {
    console.error("Registration error:", error);
    res.status(500).json({ message: "Server error during registration" });
  }
};


const login = async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.findOne({ email });
    if (!user)
      return res.status(400).json({ message: "Invalid email or password" });

    const isValidPassword = await bcrypt.compare(password, user.password);
    if (!isValidPassword)
      return res.status(400).json({ message: "Invalid email or password" });

    if (user.status !== "active")
      return res.status(400).json({ message: "User is not active" });

    const token = generateToken(user._id, user.role);

    res.json({
      "user":user,
      "token":token,
      "expiresIn": config.TOKEN_TIMEOUT,
      "message": "login successful"
    });

  } catch (error) {
    console.error("Login error:", error);
    res.status(500).json({ message: "Server error during login" });
  }
};



let getUserData = async (req, res) => {
  try {
    const user = await User.findById(req.id);
    if (!user) return res.status(404).json({ message: "User not found" });
    res.json(user);
  } catch (error) {
    res.status(500).json({ message: "Server error" });
  }
}

let updateUserData = async (req, res) => {
try {
    const updates = { ...req.body };
    delete updates.password;
    delete updates.id;
    delete updates._id;

    const user = await User.findByIdAndUpdate(req.id, updates, { new: true, runValidators: true });
    if (!user) return res.status(404).json({ message: "User not found" });
    res.json(user);
  } catch (error) {
    res.status(500).json({ message: "Server error" });
  }
}

let forgetPasswordRequest = async (req, res) => {
  try {
    const { email: userEmail } = req.body;
    const user = await User.findOne({ email: userEmail });
    if (!user) return res.status(404).json({ message: "User not found" });


    const resetToken = crypto.randomBytes(32).toString("hex");
    user.resetPasswordToken = resetToken;
    user.resetPasswordExpire = Date.now() + config.RESET_PASSWORD_TOKEN_TIMEOUT;
    await user.save();

    const resetUrl = `${config.FRONTEND_URL}/reset-password/${resetToken}`;

    const subject = "Password Reset Request";
    const body = `You requested a password reset. Click the link to reset your password: ${resetUrl}`;
    const bodyHtml = `<p>You requested a password reset.</p><p>Click <a href="${resetUrl}">here</a> to reset your password.</p>`;

    await Email.sendMail(userEmail, subject, body, bodyHtml);

    res.json({ message: "Password reset email sent" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server error" });
  }
}

let forgetPasswordUpdate = async (req, res) => {
try {
    const { token } = req.params;
    const { newPassword } = req.body;

    const user = await User.findOne({
      resetPasswordToken: token,
      resetPasswordExpire: { $gt: Date.now() },
    });

    if (!user) return res.status(400).json({ message: "Invalid or expired token" });

    user.password = newPassword;
    user.resetPasswordToken = undefined;
    user.resetPasswordExpire = undefined;

    await user.save();

    res.json({ message: "Password reset successful" });
  } catch (error) {
    res.status(500).json({ message: "Server error" });
  }
}

let resetPassword = async (req, res) => {
try {
    const { currentPassword, newPassword } = req.body;

    const user = await User.findById(req.id);
    if (!user) return res.status(404).json({ message: "User not found" });

    const isMatch = await bcrypt.compare(currentPassword, user.password);
    if (!isMatch) return res.status(400).json({ message: "Current password is incorrect" });

    user.password = newPassword
    await user.save();

    res.json({ message: "Password updated successfully" });
  } catch (error) {
    res.status(500).json({ message: "Server error" });
  }
}

module.exports = {
  register,
  login,
  getUserData,
  updateUserData,
  forgetPasswordRequest,
  forgetPasswordUpdate,
  resetPassword,
};