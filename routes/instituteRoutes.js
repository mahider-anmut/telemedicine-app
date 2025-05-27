const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getInstituteById,getInstituteByDoctorId,getAllInstitute,createInstitute,updateInstitute,deleteInstitute } = require('../controllers/instituteController');

const router = express.Router();

router.get('/user/:doctorId', getInstituteByDoctorId);
router.get('/:id', getInstituteById);
router.get('/', getAllInstitute);
router.post('/', createInstitute);
router.put('/:id', updateInstitute);
router.delete('/:id', deleteInstitute);

module.exports = router;