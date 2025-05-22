const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getScheduleById,getScheduleByDoctorId,getScheduleByPatientId,getAllSchedules,createSchedule,updateSchedule,deleteSchedule,  deleteAllWeeklySchedule,
  getAllAvailableDoctors,
  getAllAvailableDoctorsByDate,
  getTimeSlotAvailableForAppointment,
  deleteExceptionByDate,
  deleteAllExceptions,
  updateExceptionByDate,
  updateWeeklySchedule } = require('../controllers/scheduleController');

const router = express.Router();

router.get('/all-available-doctors', getAllAvailableDoctors);
router.get('/all-available-doctors-by-date', getAllAvailableDoctorsByDate);
router.get('/get-time-slot-available-for-appointment', getTimeSlotAvailableForAppointment);

router.delete('/delete-all-weekly-schedule/:id', deleteAllWeeklySchedule);
router.delete('/delete-exception-by-date/:id', deleteExceptionByDate);
router.delete('/delete-all-exceptions/:id', deleteAllExceptions);
router.put('/update-exception-by-date/:id', updateExceptionByDate);
router.put('/update-weekly-schedule/:id', updateWeeklySchedule);

router.get('/user/:doctorId', getScheduleByDoctorId);
router.get('/user/:patientId', getScheduleByPatientId);
router.get('/:id', getScheduleById);
router.get('/', getAllSchedules);
router.post('/', createSchedule);
router.put('/:id', updateSchedule);
router.delete('/:id', deleteSchedule);

module.exports = router;