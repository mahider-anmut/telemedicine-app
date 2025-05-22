const mongoose = require("mongoose");

const appointmentSchema = new mongoose.Schema(
  {
    patientId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    doctorId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
    sessionPrice: {
      type: Number,
      required: true,
    },
    sessionDuration: {
      type: Number,
      required: true,
    },
    appointmentDate:{
      type: Date,
      required: true
    },
    appointmentTime:{
      type: Date,
      required: true
    },
    appointmentStatus: {
      type: String,
      enum: ["pending", "accepted","waitingPayment","readyForSession", "cancelled", "completed","expired"],
      default: "pending",
    }
  },
  {
    timestamps: true,
    versionKey: false,
  }
);

module.exports = mongoose.model("Appointment", appointmentSchema);
