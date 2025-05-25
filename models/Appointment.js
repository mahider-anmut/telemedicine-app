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
    sessionTime:{
      type: String
    },
    appointmentDate:{
      type: Date,
      required: true
    },
    appointmentTime:{
      type: String,
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
    versionKey: false
  }
);

appointmentSchema.virtual('_doctor', {
    ref: 'User', 
    localField: 'doctorId',
    foreignField: '_id',
    justOne: true 
});

appointmentSchema.virtual('_patient', {
    ref: 'User', 
    localField: 'patientId',
    foreignField: '_id',
    justOne: true 
});

appointmentSchema.set('toJSON', { virtuals: true });

module.exports = mongoose.model("Appointment", appointmentSchema);
