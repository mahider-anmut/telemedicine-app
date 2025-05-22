const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getScheduleById,getScheduleByUserId,getAllSchedules,createSchedule,updateSchedule,deleteSchedule } = require('../controllers/scheduleController');

const router = express.Router();

router.get('/user/:userId', getScheduleByUserId);
router.get('/:id', getScheduleById);
router.get('/', getAllSchedules);
router.post('/', createSchedule);
router.put('/:id', updateSchedule);
router.delete('/:id', deleteSchedule);

export default router;