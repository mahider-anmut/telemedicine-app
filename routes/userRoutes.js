const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getUserById,getUsersByRole,getAllUsers,createUser,updateUser,deleteUser,

    getTopAvailableDoctors,
    getAllAvailableDoctors,
  getAllAvailableDoctorsByDate,
 } = require('../controllers/userController');

const router = express.Router();

router.get('/getTopAvailableDoctors', getTopAvailableDoctors);
router.get('/all-available-doctors', getAllAvailableDoctors);
router.get('/all-available-doctors-by-date', getAllAvailableDoctorsByDate);

router.get('/role/:role', getUsersByRole);
router.get('/:id', getUserById);
router.get('/', getAllUsers);
router.post('/', createUser);
router.put('/:id', updateUser);
router.delete('/:id', deleteUser);

module.exports = router;