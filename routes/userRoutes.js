const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getUserById,getUsersByRole,getAllUsers,createUser,updateUser,deleteUser } = require('../controllers/userController');

const router = express.Router();

router.get('/role/:role', getUsersByRole);
router.get('/:id', getUserById);
router.get('/', getAllUsers);
router.post('/', createUser);
router.put('/:id', updateUser);
router.delete('/:id', deleteUser);

module.exports = router;