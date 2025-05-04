const mongoose = require("mongoose");

const doctorSchema = new mongoose.Schema(
  {
    name: { type: String, required: true },
    specialty: { type: String, required: true },
    email: { type: String, required: true, unique: true },
    phone: { type: String, required: true },
    clinic: { type: String, required: true },
    bio: { type: String },
    status: { type: String, default: "Pending" }, // Pending, Approved, Rejected
  },
  { timestamps: true }
);

const Doctor = mongoose.model("Doctor", doctorSchema);

module.exports = Doctor;
