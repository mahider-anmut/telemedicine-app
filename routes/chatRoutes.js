const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getChatById,getChatByUserId,getAllChats,createChat,updateChat,deleteChat } = require('../controllers/chatController');

const router = express.Router();

router.get('/user/:userId', getChatByUserId);
router.get('/:id', getChatById);
router.get('/', getAllChats);
router.post('/', createChat);
router.put('/:id', updateChat);
router.delete('/:id', deleteChat);

export default router;