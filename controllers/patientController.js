const Patient = require("../models/Patient");

// Get all patients
const getPatients = async (req, res) => {
  try {
    const patients = await Patient.find();
    res.status(200).json(patients);
  } catch (error) {
    res.status(500).json({ message: "Error fetching patients" });
  }
};

// Get patient by ID
const getPatientById = async (req, res) => {
  try {
    const patient = await Patient.findById(req.params.id);
    if (!patient) return res.status(404).json({ message: "Patient not found" });
    res.status(200).json(patient);
  } catch (error) {
    res.status(500).json({ message: "Error fetching patient" });
  }
};

// Delete patient
const deletePatient = async (req, res) => {
  try {
    const patient = await Patient.findByIdAndDelete(req.params.id);
    if (!patient) return res.status(404).json({ message: "Patient not found" });
    res.status(200).json({ message: "Patient deleted successfully" });
  } catch (error) {
    res.status(500).json({ message: "Error deleting patient" });
  }
};

// Add patient
const addPatient = async (req, res) => {
  try {
    const { name, email, phone } = req.body;

    // Optional: Check if the patient with the same email already exists
    const existing = await Patient.findOne({ email });
    if (existing) {
      return res
        .status(400)
        .json({ message: "Patient with this email already exists" });
    }

    const newPatient = new Patient({
      name,
      email,
      phone,
      status: "Pending", // default status
    });

    await newPatient.save();
    res.status(201).json(newPatient);
  } catch (error) {
    console.error("Error adding patient:", error);
    res.status(500).json({ message: "Failed to add patient" });
  }
};

module.exports = {
  getPatients,
  getPatientById,
  deletePatient,
  addPatient, // <- Make sure to export addPatient
};
