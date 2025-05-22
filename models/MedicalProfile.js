const mongoose = require("mongoose");

const medicalProfileSchema = new mongoose.Schema(
  {
    doctorId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    yearsOfExperience: {
      type: Number,
      required: true,
    },
    specialty: {
      type: String,
      required: true,
    },
    currentHospital: {
      type: String,
    },
  },
  {
    timestamps: true,
    versionKey: false,
  }
);

module.exports = mongoose.model("MedicalProfile", medicalProfileSchema);
