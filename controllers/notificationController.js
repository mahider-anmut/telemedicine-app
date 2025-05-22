const Notification = require("../models/Notification");

let getNotificationById = (req, res) => {
  Notification.findById(req.params.id)
    .then((notification) => {
      if (!notification) return res.status(404).json({ message: "Notification not found" });
      res.json(notification);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getNotificationByUserId = (req, res) => {
  Notification.find({ userId: req.params.userId })
    .then((notifications) => res.json(notifications))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllNotifications = (req, res) => {
  Notification.find()
    .then((notifications) => res.json(notifications))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createNotification = (req, res) => {
  const newNotification = new Notification(req.body);
  newNotification
    .save()
    .then((notification) => res.status(201).json(notification))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let updateNotification = (req, res) => {
  Notification.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((notification) => {
      if (!notification) return res.status(404).json({ message: "Notification not found" });
      res.json(notification);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let deleteNotification = (req, res) => {
  Notification.findByIdAndDelete(req.params.id)
    .then((notification) => {
      if (!notification) return res.status(404).json({ message: "Notification not found" });
      res.json({ message: "Notification deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

module.exports = {
  getNotificationById,
  getNotificationByUserId,
  getAllNotifications,
  createNotification,
  updateNotification,
  deleteNotification,
};
