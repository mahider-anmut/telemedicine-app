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
  updateAvailability,
  deleteAvailability,
  getAvailableDoctors,
} = require("../controllers/doctorController");

router.get("/", getDoctors);
router.post("/", addDoctor);
router.put("/approve/:id", approveDoctor);
router.put("/reject/:id", rejectDoctor);
router.get("/user/:userId", getDoctorByUserId);
router.get("/available", getAvailableDoctors);
router.get("/:id", getDoctorById);
router.delete("/:id", deleteDoctor);
router.post("/:id/availability", addAvailability);
router.get("/:id/availability", getAvailability);
// Update time slot by availabilityId
router.patch("/:doctorId/availability/:availabilityId", updateAvailability);

// Delete time slot by availabilityId
router.delete("/:doctorId/availability/:availabilityId", deleteAvailability);

router.get("/available", getAvailableDoctors);

module.exports = router;
