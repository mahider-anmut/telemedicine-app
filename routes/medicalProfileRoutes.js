const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getMedicalProfileById,getMedicalProfileByUserId,getAllMedicalProfiles,createMedicalProfile,updateMedicalProfile,deleteMedicalProfile } = require('../controllers/medicalProfileController');

const router = express.Router();

router.get('/user/:userId', getMedicalProfileByUserId);
router.get('/:id', getMedicalProfileById);
router.get('/', getAllMedicalProfiles);
router.post('/', createMedicalProfile);
router.put('/:id', updateMedicalProfile);
router.delete('/:id', deleteMedicalProfile);

module.exports = router;