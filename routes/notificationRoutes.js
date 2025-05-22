const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getNotificationById,getNotificationByUserId,getAllNotifications,createNotification,updateNotification,deleteNotification } = require('../controllers/notificationController');

const router = express.Router();

router.get('/user/:userId', getNotificationByUserId);
router.get('/:id', getNotificationById);
router.get('/', getAllNotifications);
router.post('/', createNotification);
router.put('/:id', updateNotification);
router.delete('/:id', deleteNotification);

module.exports = router;