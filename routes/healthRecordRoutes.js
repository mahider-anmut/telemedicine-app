const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getHealthRecordById,getHealthRecordByUserId,getAllHealthRecords,createHealthRecord,updateHealthRecord,deleteHealthRecord } = require('../controllers/healthRecordController');

const router = express.Router();

router.get('/user/:userId', getHealthRecordByUserId);
router.get('/:id', getHealthRecordById);
router.get('/', getAllHealthRecords);
router.post('/', createHealthRecord);
router.put('/:id', updateHealthRecord);
router.delete('/:id', deleteHealthRecord);

export default router;