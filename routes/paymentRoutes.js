const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { initiatePayment,paymentCallback,paymentStatusByAppointmentId,paymentStatusByTransactionId,paymentStatusByUserId } = require('../controllers/paymentController');

const router = express.Router();


router.post('/initiate', initiatePayment);
router.post('/callback', paymentCallback);
router.get('/check-status/appointment/:id', paymentStatusByAppointmentId);
router.get('/check-status/transaction/:id', paymentStatusByTransactionId);
router.get('/check-status/user/:id', paymentStatusByUserId);

module.exports = router;