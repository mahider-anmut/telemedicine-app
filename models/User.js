const mongoose = require("mongoose");
const bcrypt = require("bcryptjs");

const config = require("../config/config");

const userSchema = new mongoose.Schema(
  {
    firstName: {
      type: String,
      required: true,
    },
    lastName: { 
      type: String, 
      required: true },
    email: {
      type: String,
      required: true,
      unique: true,
    },
    password: {
      type: String,
      required: true,
      select: false
    },
    role: {
      type: String,
      enum: ["patient", "doctor", "admin"],
      default: "patient",
    },
    phone: { type: String},
    gender: { type: String },
    birthdate: { type: Number },
    address: { type: String },
    bio: { type: String },
    profileImage: { type: String },
    metaData: {
      deviceId: { type: String },
      preferredLang: {
        type: String,
        enum: ["en", "am"],
        default: "en"
      },
      selectedTheme: {
        type: String,
        enum: ["light", "dark"],
        default: "light"
      }
    },
    status: {
      type: String,
      enum: ["pending", "active", "rejected", "blocked"],
      default: "pending",
    },
    resetPasswordToken: { 
      type: String,
      select: false
    },
    resetPasswordExpire: { 
      type: Date,
      select: false
    },
  },
  {
    timestamps: true,
    versionKey: false
  }
);

userSchema.pre("save", function(next) {
  let user = this;

  if (!user.isModified("password")) {
    return next();
  }

  bcrypt.hash(user.password, config.HASH_ROUND, function(err, hash) {
    if (err) {
      console.log("error: 500 unable to hash password!");
    } else {
      user.password = hash;
      next();
    }
  });
});

userSchema.statics.authenticate = async function(username, password) {
  try {
    const user = await this.findOne({ email: username }).select('+password');

    if (!user) {
      const error = new Error("User not found.");
      error.status = 401;
      throw error;
    }

    if (user.status !== "active") {
      const error = new Error("User is not active.");
      error.status = 401;
      throw error;
    }

    const match = await bcrypt.compare(password, user.password);
    if (!match) {
      const error = new Error("Incorrect password.");
      error.status = 401;
      throw error;
    }

    return user;
  } catch (err) {
    throw err;
  }
};


module.exports = mongoose.model("User", userSchema);