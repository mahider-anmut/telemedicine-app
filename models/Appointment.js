const mongoose = require("mongoose");

const appointmentSchema = new mongoose.Schema(
  {
    doctorId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Doctor",
      required: true,
    },
    patientId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    doctorName: { type: String, required: true },
    specialty: { type: String },
    date: { type: String, required: true },
    time: { type: String, required: true },
    amount: { type: Number },
    status: {
      type: String,
      enum: ["Pending", "Confirmed", "Declined"],
      default: "Pending",
    },
    paymentStatus: {
      type: String,
      enum: ["Pending", "Paid"],
      default: "Pending",
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Appointment", appointmentSchema);
