const Statistics = require("../models/Statistics");

let getStatisticsById = (req, res) => {
  Statistics.findById(req.params.id)
    .then((statistics) => {
      if (!statistics) return res.status(404).json({ message: "Statistics not found" });
      res.json(statistics);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getStatisticsByDoctorId = (req, res) => {
  Statistics.find({ doctorId: req.params.doctorId })
    .then((statistics) => res.json(statistics))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllStatistics = (req, res) => {
  Statistics.find()
    .then((statistics) => res.json(statistics))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createStatistics = (req, res) => {
  const newStatistics = new Statistics(req.body);
  newStatistics
    .save()
    .then((statistics) => res.status(201).json(statistics))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let updateStatistics = (req, res) => {
  Statistics.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((statistics) => {
      if (!statistics) return res.status(404).json({ message: "Statistics not found" });
      res.json(statistics);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let deleteStatistics = (req, res) => {
  Statistics.findByIdAndDelete(req.params.id)
    .then((statistics) => {
      if (!statistics) return res.status(404).json({ message: "Statistics not found" });
      res.json({ message: "Statistics deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

module.exports = {
  getStatisticsById,
  getStatisticsByDoctorId,
  getAllStatistics,
  createStatistics,
  updateStatistics,
  deleteStatistics,
};
