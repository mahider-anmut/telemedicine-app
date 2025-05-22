const HealthRecord = require("../models/HealthRecord");

let getHealthRecordById = (req, res) => {
  HealthRecord.findById(req.params.id)
    .then((healthRecord) => {
      if (!healthRecord) return res.status(404).json({ message: "HealthRecord not found" });
      res.json(healthRecord);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getHealthRecordByUserId = (req, res) => {
  HealthRecord.find({ userId: req.params.userId })
    .then((healthRecords) => res.json(healthRecords))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllHealthRecords = (req, res) => {
  HealthRecord.find()
    .then((healthRecords) => res.json(healthRecords))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createHealthRecord = (req, res) => {
  const newHealthRecord = new HealthRecord(req.body);
  newHealthRecord
    .save()
    .then((healthRecord) => res.status(201).json(healthRecord))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let updateHealthRecord = (req, res) => {
  HealthRecord.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((healthRecord) => {
      if (!healthRecord) return res.status(404).json({ message: "HealthRecord not found" });
      res.json(healthRecord);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let deleteHealthRecord = (req, res) => {
  HealthRecord.findByIdAndDelete(req.params.id)
    .then((healthRecord) => {
      if (!healthRecord) return res.status(404).json({ message: "HealthRecord not found" });
      res.json({ message: "HealthRecord deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

module.exports = {
  getHealthRecordById,
  getHealthRecordByUserId,
  getAllHealthRecords,
  createHealthRecord,
  updateHealthRecord,
  deleteHealthRecord,
};
