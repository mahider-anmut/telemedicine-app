const Chat = require("../models/Chat");

let getChatById = (req, res) => {
  Chat.findById(req.params.id)
    .then((chat) => {
      if (!chat) return res.status(404).json({ message: "Chat not found" });
      res.json(chat);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getChatByUserId = (req, res) => {
  // Chat.find({ userId: req.params.userId })
  Chat.find({
    $or: [
      { doctorId: req.params.userId },
      { patientId: req.params.userId }
    ]
  }).populate('_patient').populate('_doctor').then((chats) => res.json(chats))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllChats = (req, res) => {
  Chat.find()
    .then((chats) => res.json(chats))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createChat = (req, res) => {
  const newChat = new Chat(req.body);
  newChat
    .save()
    .then((chat) => res.status(201).json(chat))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let updateChat = (req, res) => {
  Chat.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((chat) => {
      if (!chat) return res.status(404).json({ message: "Chat not found" });
      res.json(chat);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let deleteChat = (req, res) => {
  Chat.findByIdAndDelete(req.params.id)
    .then((chat) => {
      if (!chat) return res.status(404).json({ message: "Chat not found" });
      res.json({ message: "Chat deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

module.exports = {
  getChatById,
  getChatByUserId,
  getAllChats,
  createChat,
  updateChat,
  deleteChat,
};
