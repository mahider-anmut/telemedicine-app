const express = require("express");

const auth = require("../middlewares/authMiddleware");

const { getAppointmentCallUrl} = require('../controllers/videoCallController');

const router = express.Router();

router.get('/appointment/:id', getAppointmentCallUrl);

module.exports = router;