const express = require("express");
const router = express.Router();
const {
  getPatients,
  getPatientById,
  deletePatient,
  addPatient, // <- Import the addPatient function
} = require("../controllers/patientController");

router.get("/", getPatients);
router.get("/:id", getPatientById);
router.delete("/:id", deletePatient);
router.post("/", addPatient); // <- Add the POST route for adding a patient

module.exports = router;
