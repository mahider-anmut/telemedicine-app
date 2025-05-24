const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getScheduleById,getScheduleByDoctorId,getAllSchedules,createSchedule,updateSchedule,deleteSchedule,  deleteAllWeeklySchedule,
  getTimeSlotAvailableForAppointment,
  deleteExceptionByDate,
  deleteAllExceptions,
  updateExceptionByDate,
  updateExceptionSchedule,
  updateWeeklySchedule } = require('../controllers/scheduleController');

const router = express.Router();


router.get('/get-time-slot-available-for-appointment', getTimeSlotAvailableForAppointment);

router.delete('/delete-all-weekly-schedule/:id', deleteAllWeeklySchedule);
router.delete('/delete-exception-by-date/:id', deleteExceptionByDate);
router.delete('/delete-all-exceptions/:id', deleteAllExceptions);
router.put('/update-exception-by-date/:id', updateExceptionByDate);
router.put('/update-weekly-schedule/:id', updateWeeklySchedule);
router.put('/update-exception-schedule/:id', updateExceptionSchedule);

router.get('/user/:doctorId', getScheduleByDoctorId);
router.get('/:id', getScheduleById);
router.get('/', getAllSchedules);
router.post('/', createSchedule);
router.put('/:id', updateSchedule);
router.delete('/:id', deleteSchedule);

module.exports = router;