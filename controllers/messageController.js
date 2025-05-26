const Message = require("../models/Message");

let getMessageById = (req, res) => {
  Message.findById(req.params.id)
    .then((message) => {
      if (!message) return res.status(404).json({ message: "Message not found" });
      res.json(message);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getMessageByChatId = (req, res) => {
  Message.find({ chatId: req.params.chatId })
    .then((messages) => res.json(messages))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllMessages = (req, res) => {
  Message.find()
    .then((messages) => res.json(messages))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createMessage = (req, res) => {
  const newMessage = new Message(req.body);
  newMessage
    .save()
    .then((message) => res.status(201).json(message))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let updateMessage = (req, res) => {
  Message.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((message) => {
      if (!message) return res.status(404).json({ message: "Message not found" });
      res.json(message);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let deleteMessage = (req, res) => {
  Message.findByIdAndDelete(req.params.id)
    .then((message) => {
      if (!message) return res.status(404).json({ message: "Message not found" });
      res.json({ message: "Message deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

module.exports = {
  getMessageById,
  getMessageByChatId,
  getAllMessages,
  createMessage,
  updateMessage,
  deleteMessage,
};
