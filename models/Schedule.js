const mongoose = require("mongoose");

const scheduleSchema = new mongoose.Schema(
  {
    doctorId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    weeklySchedule: {
      monday: { type: [String], default: [] },
      tuesday: { type: [String], default: [] },
      wednesday: { type: [String], default: [] },
      thursday: { type: [String], default: [] },
      friday: { type: [String], default: [] },
      saturday: { type: [String], default: [] },
      sunday: { type: [String], default: [] },
    },
    exceptions: {
      type:  [
        {
          date: { type: Date, required: true },
          timeSlots: [String],
        },
      ],
      default: [],
    },
    sessionDuration: {
      type: Number, 
      required: true,
      default: 30
    },
    sessionPrice: {
      type: Number,
      required: true,
    },
  },
  {
    timestamps: true,
    versionKey: false,
  }
);

module.exports = mongoose.model("Schedule", scheduleSchema);
