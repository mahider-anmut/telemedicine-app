const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { initiatePayment,paymentCallback,paymentStatusByAppointmentId,paymentStatusByTransactionId,paymentStatusByUserId } = require('../controllers/paymentController');

const router = express.Router();


router.post('/initiate',auth.isAuthenticated, initiatePayment);
router.post('/callback', paymentCallback);
router.get('/check-status/appointment/:id',auth.isAuthenticated, paymentStatusByAppointmentId);
router.get('/check-status/transaction/:id',auth.isAuthenticated, paymentStatusByTransactionId);
router.get('/check-status/user/:id',auth.isAuthenticated, paymentStatusByUserId);

module.exports = router;