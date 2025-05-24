const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getStatisticsById,getStatisticsByDoctorId,getAllStatistics,createStatistics,updateStatistics,deleteStatistics } = require('../controllers/statisticsController');

const router = express.Router();

router.get('/user/:doctorId', getStatisticsByDoctorId);
router.get('/:id', getStatisticsById);
router.get('/', getAllStatistics);
router.post('/', createStatistics);
router.put('/:id', updateStatistics);
router.delete('/:id', deleteStatistics);

module.exports = router;