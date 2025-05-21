const express = require("express");
const router = express.Router();
const {
  createAppointment,
  getAppointmentsByUser,
  getAppointmentsForDoctor,
  updateAppointmentStatus,
  markAppointmentAsPaid,
} = require("../controllers/appointmentController");

// Create new appointment
router.post("/", createAppointment);

// Get appointments for current patient
router.get("/", getAppointmentsByUser);

// Get appointments for doctor
router.get("/doctor/:doctorId", getAppointmentsForDoctor);

// Doctor confirms or declines appointment
router.put("/:id/status", updateAppointmentStatus);

// Patient marks appointment as paid
router.put("/:id/pay", markAppointmentAsPaid);

module.exports = router;
