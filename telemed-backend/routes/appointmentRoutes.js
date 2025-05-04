// routes/appointmentRoutes.js
const express = require("express");
const {
  createAppointment,
  getAppointmentsByPatient,
  getAppointmentsByDoctor,
  confirmAppointment,
  rejectAppointment,
} = require("../controllers/appointmentController");

const router = express.Router();

// Appointment routes
// Route to create a new appointment (after payment is confirmed)
router.post("/", createAppointment);

// Route to get all appointments of a specific patient by patient ID
router.get("/patient/:id", getAppointmentsByPatient);

// Route to get all appointments of a specific doctor by doctor ID
router.get("/doctor/:id", getAppointmentsByDoctor);

// Route to confirm an appointment by appointment ID
router.patch("/:id/confirm", confirmAppointment);

// Route to reject an appointment by appointment ID (and refund)
router.patch("/:id/reject", rejectAppointment);

module.exports = router;
