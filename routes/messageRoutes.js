const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getMessageById,getMessageByChatId,getAllMessages,createMessage,updateMessage,deleteMessage } = require('../controllers/messageController');

const router = express.Router();

router.get('/chat/:chatId', getMessageByChatId);
router.get('/:id', getMessageById);
router.get('/', getAllMessages);
router.post('/', createMessage);
router.put('/:id', updateMessage);
router.delete('/:id', deleteMessage);

module.exports = router;