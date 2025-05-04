const mongoose = require("mongoose");
const Doctor = require("./Doctor");

const appointmentSchema = new mongoose.Schema(
  {
    patient: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    doctor: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Doctor",
      required: true,
    },
    date: {
      type: String,
      required: true,
    },
    time: {
      type: String,
      required: true,
    },
    amount: {
      type: Number,
      required: true,
    },
    status: {
      type: String,
      enum: ["Pending", "Confirmed", "Declined"],
      default: "Pending",
    },
    paymentStatus: {
      type: String,
      enum: ["Unpaid", "Paid", "Refunded"],
      default: "Unpaid",
    },
  },
  { timestamps: true }
);

// Pre-save hook: remove selected time slot from doctor's availability
appointmentSchema.pre("save", async function (next) {
  const appointment = this;

  try {
    const doctor = await Doctor.findById(appointment.doctor);

    if (!doctor) {
      return next(new Error("Doctor not found"));
    }

    const availabilityForDate = doctor.availability.find(
      (slot) => slot.date === appointment.date
    );

    if (!availabilityForDate) {
      return next(new Error("No availability found for the selected date"));
    }

    const timeIndex = availabilityForDate.timeSlots.indexOf(appointment.time);

    if (timeIndex === -1) {
      return next(new Error("Selected time slot is not available"));
    }

    // Remove the time slot to prevent double booking
    availabilityForDate.timeSlots.splice(timeIndex, 1);

    // Remove the date entry if no more slots remain
    if (availabilityForDate.timeSlots.length === 0) {
      doctor.availability = doctor.availability.filter(
        (slot) => slot.date !== appointment.date
      );
    }

    await doctor.save();
    next();
  } catch (err) {
    next(err);
  }
});

module.exports = mongoose.model("Appointment", appointmentSchema);
