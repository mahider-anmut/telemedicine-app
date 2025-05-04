const express = require("express");
const router = express.Router();
const {
  getDoctors,
  addDoctor,
  approveDoctor,
  rejectDoctor,
  getDoctorById,
  deleteDoctor,
} = require("../controllers/doctorController");

router.get("/", getDoctors);
router.post("/", addDoctor);
router.put("/approve/:id", approveDoctor);
router.put("/reject/:id", rejectDoctor);
router.get("/:id", getDoctorById);
router.delete("/:id", deleteDoctor);

module.exports = router;
