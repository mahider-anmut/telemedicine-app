const mongoose = require("mongoose");

const doctorSchema = new mongoose.Schema(
  {
    user: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true },
    name: { type: String, required: true },
    specialty: { type: String, required: true },
    phone: { type: String, required: true },
    clinic: { type: String },
    bio: { type: String },
    profileImage: { type: String },
    status: {
      type: String,
      enum: ["Pending", "Approved", "Rejected"],
      default: "Pending",
    },
    availability: [
      {
        date: { type: Date, required: true },
        timeSlots: [String],
      },
    ],
  },
  {
    timestamps: true,
  }
);

module.exports = mongoose.model("Doctor", doctorSchema);
