const express = require("express");
const router = express.Router();
const {
  getDoctors,
  addDoctor,
  approveDoctor,
  rejectDoctor,
  getDoctorById,
  deleteDoctor,
  addAvailability,
  getAvailability,
  getDoctorByUserId,
} = require("../controllers/doctorController");

router.get("/", getDoctors);
router.post("/", addDoctor);
router.put("/approve/:id", approveDoctor);
router.put("/reject/:id", rejectDoctor);
router.get("/user/:userId", getDoctorByUserId);
router.get("/:id", getDoctorById);
router.delete("/:id", deleteDoctor);
router.post("/:id/availability", addAvailability);
router.get("/:id/availability", getAvailability);
module.exports = router;
