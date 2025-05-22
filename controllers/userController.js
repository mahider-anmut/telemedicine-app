const User = require("../models/User");
const Utils = require("../utils/utils");
const Email = require("../services/mailService");

let getUserById = (req, res) => {
  User.findById(req.params.id)
    .then((user) => {
      if (!user) return res.status(404).json({ message: "User not found" });
      res.json(user);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getUsersByRole = (req, res) => {
  User.find({ role: req.params.role })
    .then((users) => res.json(users))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllUsers = (req, res) => {
  User.find()
    .then((users) => res.json(users))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createUser = async (req, res) => {
  try {
    const { role, email, ...userData } = req.body;

    let userRole = 'patient';
    const isAdmin = req.role === 'admin';

    if (isAdmin) {
      if (role && ['doctor', 'admin', 'patient'].includes(role)) {
        userRole = role;
      }
    } else {
      if (role && role !== 'patient') {
        return res.status(403).json({ message: 'You are not authorized to assign this role' });
      }
    }

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: 'User already exists' });
    }

    let passwordToSet = userData.password;

    if (userRole === 'doctor' && isAdmin) {
      passwordToSet = Utils.generateRandomPassword();
    }

    const newUser = new User({
      email,
      role: userRole,
      password: passwordToSet,
      ...userData,
    });

    await newUser.save();

    if (userRole === 'doctor' && isAdmin) {
      await Email.sendMail(
        newUser.email,
        'Your account has been created',
        `Your password is ${passwordToSet}`,
        `<p>Your password is <strong>${passwordToSet}</strong></p>`
      );
    }

    res.status(201).json(newUser);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};


let updateUser = (req, res) => {
  User.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((user) => {
      if (!user) return res.status(404).json({ message: "User not found" });
      res.json(user);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let deleteUser = (req, res) => {
  User.findByIdAndDelete(req.params.id)
    .then((user) => {
      if (!user) return res.status(404).json({ message: "User not found" });
      res.json({ message: "User deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

module.exports = {
  getUserById,
  getUsersByRole,
  getAllUsers,
  createUser,
  updateUser,
  deleteUser,
};