const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { register, login,getUserData,updateUserData,forgetPasswordRequest,forgetPasswordUpdate,resetPassword } = require("../controllers/authController");

const router = express.Router();

router.post("/register", register);
router.post("/login", login);

router.get('/me', auth.isAuthenticated, getUserData);
router.put('/update', auth.isAuthenticated, updateUserData);
router.post("/forget-password-request", forgetPasswordRequest);
router.post("/forget-password-update", forgetPasswordUpdate);
router.post("/reset-password",auth.isAuthenticated, resetPassword);

module.exports = router;
