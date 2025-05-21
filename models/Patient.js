const mongoose = require("mongoose");

const patientSchema = new mongoose.Schema({
  name: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  phone: { type: String },
  gender: { type: String },
  age: { type: Number },
  address: { type: String },
  createdAt: { type: Date, default: Date.now },
});

module.exports = mongoose.model("Patient", patientSchema);
