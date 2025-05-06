const Appointment = require("../models/Appointment");
const Doctor = require("../models/Doctor");
const Payment = require("../models/Payment");

const createAppointment = async (req, res) => {
  try {
    const { patientId, doctorId, date, time, amount, paymentStatus } = req.body;

    if (paymentStatus !== "confirmed") {
      return res.status(400).json({ message: "Payment not confirmed." });
    }

    const doctor = await Doctor.findById(doctorId);
    if (!doctor) {
      return res.status(404).json({ message: "Doctor not found." });
    }

    // Find matching availability date
    const availabilityForDate = doctor.availability.find(
      (slot) => slot.date === date
    );

    if (!availabilityForDate) {
      return res
        .status(400)
        .json({ message: "Doctor is not available on this date." });
    }

    // Check if the time slot is available
    const timeIndex = availabilityForDate.timeSlots.indexOf(time);
    if (timeIndex === -1) {
      return res.status(400).json({ message: "Time slot not available." });
    }

    // Remove the time slot to prevent double booking
    availabilityForDate.timeSlots.splice(timeIndex, 1);

    // Remove the date entry if no more time slots remain
    if (availabilityForDate.timeSlots.length === 0) {
      doctor.availability = doctor.availability.filter(
        (slot) => slot.date !== date
      );
    }

    await doctor.save();

    // Create the appointment
    const newAppointment = new Appointment({
      patient: patientId,
      doctor: doctorId,
      date,
      time,
      amount,
      status: "Pending",
      paymentStatus: "Paid",
    });

    await newAppointment.save();
    res.status(201).json(newAppointment);
  } catch (error) {
    console.error("Error creating appointment:", error);
    res.status(500).json({ message: "Error creating appointment" });
  }
};

const getAppointmentsByPatient = async (req, res) => {
  try {
    const patientId = req.params.id;

    const appointments = await Appointment.find({ patient: patientId })
      .populate("doctor", "name specialty")
      .sort({ date: -1 });

    res.status(200).json(appointments);
  } catch (error) {
    console.error("Error fetching appointments by patient:", error);
    res.status(500).json({ message: "Error fetching appointments" });
  }
};

const getAppointmentsByDoctor = async (req, res) => {
  try {
    const doctorId = req.params.id;

    const appointments = await Appointment.find({ doctor: doctorId })
      .populate("patient", "name")
      .sort({ date: -1 });

    res.status(200).json(appointments);
  } catch (error) {
    console.error("Error fetching appointments by doctor:", error);
    res.status(500).json({ message: "Error fetching appointments" });
  }
};

const confirmAppointment = async (req, res) => {
  try {
    const appointmentId = req.params.id;

    const appointment = await Appointment.findById(appointmentId);
    if (!appointment) {
      return res.status(404).json({ message: "Appointment not found" });
    }

    appointment.status = "Confirmed";
    await appointment.save();

    res.status(200).json(appointment);
  } catch (error) {
    console.error("Error confirming appointment:", error);
    res.status(500).json({ message: "Error confirming appointment" });
  }
};

const rejectAppointment = async (req, res) => {
  try {
    const appointmentId = req.params.id;

    const appointment = await Appointment.findById(appointmentId);
    if (!appointment) {
      return res.status(404).json({ message: "Appointment not found" });
    }

    const doctor = await Doctor.findById(appointment.doctor);
    if (!doctor) {
      return res.status(404).json({ message: "Doctor not found" });
    }

    // Restore the time slot
    let availabilityForDate = doctor.availability.find(
      (slot) => slot.date === appointment.date
    );

    if (availabilityForDate) {
      // Add time back if it doesn't already exist
      if (!availabilityForDate.timeSlots.includes(appointment.time)) {
        availabilityForDate.timeSlots.push(appointment.time);
        availabilityForDate.timeSlots.sort(); // optional
      }
    } else {
      // If the date entry doesn't exist, create it
      doctor.availability.push({
        date: appointment.date,
        timeSlots: [appointment.time],
      });
    }

    await doctor.save();

    // Handle refund if payment exists
    const payment = await Payment.findOne({ appointmentId });
    if (payment) {
      await handleRefund(payment);
    }

    appointment.status = "Declined";
    appointment.paymentStatus = "Refunded";
    await appointment.save();

    res
      .status(200)
      .json({ message: "Appointment rejected and availability restored" });
  } catch (error) {
    console.error("Error rejecting appointment:", error);
    res.status(500).json({ message: "Error rejecting appointment" });
  }
};

// Dummy refund function
const handleRefund = async (payment) => {
  console.log("Refund initiated for payment ID:", payment._id);
};

module.exports = {
  createAppointment,
  getAppointmentsByPatient,
  getAppointmentsByDoctor,
  confirmAppointment,
  rejectAppointment,
};
