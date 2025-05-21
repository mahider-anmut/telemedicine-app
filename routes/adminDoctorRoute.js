const express = require("express");
const router = express.Router();
const { verifyAdminToken } = require("../middleware/authMiddleware"); // You must also create this middleware

// Sample doctor storage (temporary; replace with DB logic later)
const doctors = [];

// @route   POST /api/admin/doctors
// @desc    Add a new doctor
// @access  Admin only
router.post("/", verifyAdminToken, (req, res) => {
  const { name, specialty, email, phone, clinic, bio } = req.body;

  if (!name || !specialty || !email || !phone || !clinic || !bio) {
    return res.status(400).json({ message: "All fields are required." });
  }

  const newDoctor = {
    id: doctors.length + 1,
    name,
    specialty,
    email,
    phone,
    clinic,
    bio,
    approved: false, // default status
  };

  doctors.push(newDoctor);

  res.status(201).json(newDoctor);
});

module.exports = router;
