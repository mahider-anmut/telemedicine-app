const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getAppointmentById,getAppointmentByUserId,getAllAppointments,createAppointment,updateAppointment,deleteAppointment } = require('../controllers/appointmentController');

const router = express.Router();


router.get('/user/:userId', getAppointmentByUserId);
router.get('/:id', getAppointmentById);
router.get('/', getAllAppointments);
router.post('/', createAppointment);
router.put('/:id', updateAppointment);
router.delete('/:id', deleteAppointment);

module.exports = router;