const Institute = require("../models/Institute");

let getInstituteById = (req, res) => {
  Institute.findById(req.params.id)
    .then((institute) => {
      if (!institute) return res.status(404).json({ message: "Institute not found" });
      res.json(institute);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getInstituteByDoctorId = (req, res) => {
  Institute.find({ doctorId: req.params.doctorId })
    .then((institute) => res.json(institute))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllInstitute = (req, res) => {
  Institute.find()
    .then((institute) => res.json(institute))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createInstitute = (req, res) => {
  const newInstitute = new Institute(req.body);
  newInstitute
    .save()
    .then((institute) => res.status(201).json(institute))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let updateInstitute = (req, res) => {
  Institute.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((institute) => {
      if (!institute) return res.status(404).json({ message: "Institute not found" });
      res.json(institute);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let deleteInstitute = (req, res) => {
  Institute.findByIdAndDelete(req.params.id)
    .then((institute) => {
      if (!institute) return res.status(404).json({ message: "Institute not found" });
      res.json({ message: "Institute deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

module.exports = {
  getInstituteById,
  getInstituteByDoctorId,
  getAllInstitute,
  createInstitute,
  updateInstitute,
  deleteInstitute,
};
