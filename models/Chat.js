const mongoose = require("mongoose");

const chatSchema = new mongoose.Schema(
  {
    doctorId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    patientId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    appointmentId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Appointment",
      required: false,
    },
    status:{
      type: String,
      enum: ["open", "closed"],
      default: "open"
    },
    lastMessage: {
      type: String,
      default: "",
    },
    unreadCount: {
      type: Number,
      default: 0,
    },
  },
  {
    timestamps: true,
    versionKey: false,
  }
);

chatSchema.virtual('_doctor', {
    ref: 'User', 
    localField: 'doctorId',
    foreignField: '_id',
    justOne: true 
});

chatSchema.virtual('_patient', {
    ref: 'User', 
    localField: 'patientId',
    foreignField: '_id',
    justOne: true 
});

chatSchema.set('toJSON', { virtuals: true });

module.exports = mongoose.model("Chat", chatSchema);
