const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getMessageById,getMessageByUserId,getAllMessages,createMessage,updateMessage,deleteMessage } = require('../controllers/messageController');

const router = express.Router();

router.get('/user/:userId', getMessageByUserId);
router.get('/:id', getMessageById);
router.get('/', getAllMessages);
router.post('/', createMessage);
router.put('/:id', updateMessage);
router.delete('/:id', deleteMessage);

module.exports = router;