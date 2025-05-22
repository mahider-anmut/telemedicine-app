const MedicalProfile = require("../models/MedicalProfile");

let getMedicalProfileById = (req, res) => {
  MedicalProfile.findById(req.params.id)
    .then((medicalProfile) => {
      if (!medicalProfile) return res.status(404).json({ message: "MedicalProfile not found" });
      res.json(medicalProfile);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getMedicalProfileByUserId = (req, res) => {
  MedicalProfile.find({ userId: req.params.userId })
    .then((medicalProfiles) => res.json(medicalProfiles))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllMedicalProfiles = (req, res) => {
  MedicalProfile.find()
    .then((medicalProfiles) => res.json(medicalProfiles))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createMedicalProfile = (req, res) => {
  const newMedicalProfile = new MedicalProfile(req.body);
  newMedicalProfile
    .save()
    .then((medicalProfile) => res.status(201).json(medicalProfile))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let updateMedicalProfile = (req, res) => {
  MedicalProfile.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((medicalProfile) => {
      if (!medicalProfile) return res.status(404).json({ message: "MedicalProfile not found" });
      res.json(medicalProfile);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let deleteMedicalProfile = (req, res) => {
  MedicalProfile.findByIdAndDelete(req.params.id)
    .then((medicalProfile) => {
      if (!medicalProfile) return res.status(404).json({ message: "MedicalProfile not found" });
      res.json({ message: "MedicalProfile deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

module.exports = {
  getMedicalProfileById,
  getMedicalProfileByUserId,
  getAllMedicalProfiles,
  createMedicalProfile,
  updateMedicalProfile,
  deleteMedicalProfile,
};
