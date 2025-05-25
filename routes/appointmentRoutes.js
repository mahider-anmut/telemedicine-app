const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getAppointmentById,getAppointmentByDoctorId,getAllAppointments,createAppointment,updateAppointment,deleteAppointment, getAppointmentByPatientId,updateAppointmentStatus } = require('../controllers/appointmentController');

const router = express.Router();


router.get('/doctor/:doctorId', getAppointmentByDoctorId);
router.get('/patient/:patientId', getAppointmentByPatientId);
router.put('/update-status/:id', updateAppointmentStatus);
router.get('/:id', getAppointmentById);
router.get('/', getAllAppointments);
router.post('/', createAppointment);
router.put('/:id', updateAppointment);
router.delete('/:id', deleteAppointment);

module.exports = router;