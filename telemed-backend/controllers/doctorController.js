const Doctor = require("../models/Doctor");

// GET all doctors
const getDoctors = async (req, res) => {
  try {
    const doctors = await Doctor.find();
    res.status(200).json(doctors);
  } catch (error) {
    res.status(500).json({ message: "Error fetching doctors" });
  }
};

// POST new doctor
const addDoctor = async (req, res) => {
  const { name, specialty, email, phone, clinic, bio } = req.body;

  try {
    const newDoctor = new Doctor({
      name,
      specialty,
      email,
      phone,
      clinic,
      bio,
    });

    await newDoctor.save();
    res.status(201).json(newDoctor);
  } catch (error) {
    res.status(500).json({ message: "Error adding doctor" });
  }
};

// PUT approve doctor
const approveDoctor = async (req, res) => {
  try {
    const doctor = await Doctor.findByIdAndUpdate(
      req.params.id,
      { status: "Approved" },
      { new: true }
    );

    if (!doctor) {
      return res.status(404).json({ message: "Doctor not found" });
    }

    res.status(200).json(doctor);
  } catch (error) {
    res.status(500).json({ message: "Error approving doctor" });
  }
};

// PUT reject doctor
const rejectDoctor = async (req, res) => {
  try {
    const doctor = await Doctor.findByIdAndUpdate(
      req.params.id,
      { status: "Rejected" },
      { new: true }
    );

    if (!doctor) {
      return res.status(404).json({ message: "Doctor not found" });
    }

    res.status(200).json(doctor);
  } catch (error) {
    res.status(500).json({ message: "Error rejecting doctor" });
  }
};

// GET doctor by ID
const getDoctorById = async (req, res) => {
  try {
    const doctor = await Doctor.findById(req.params.id);

    if (!doctor) {
      return res.status(404).json({ message: "Doctor not found" });
    }

    res.status(200).json(doctor);
  } catch (error) {
    res.status(500).json({ message: "Error fetching doctor details" });
  }
};

// DELETE doctor
const deleteDoctor = async (req, res) => {
  try {
    const doctor = await Doctor.findByIdAndDelete(req.params.id);

    if (!doctor) {
      return res.status(404).json({ message: "Doctor not found" });
    }

    res.status(200).json({ message: "Doctor deleted successfully" });
  } catch (error) {
    console.error("Error deleting doctor:", error);
    res.status(500).json({ message: "Failed to delete doctor" });
  }
};

// POST: Add availability to a doctor
// POST: Add availability to a doctor
const addAvailability = async (req, res) => {
  const doctorId = req.params.id;
  const { date, timeSlots } = req.body;

  try {
    const doctor = await Doctor.findById(doctorId);
    if (!doctor) return res.status(404).json({ message: "Doctor not found" });

    // Convert the string date to a Date object for comparison
    const formattedDate = new Date(date).toISOString().split("T")[0]; // format to YYYY-MM-DD

    // Check if availability for this date already exists
    const existing = doctor.availability.find((a) => {
      return a.date.toISOString().split("T")[0] === formattedDate;
    });

    if (existing) {
      // Merge time slots without duplicates
      existing.timeSlots = Array.from(
        new Set([...existing.timeSlots, ...timeSlots])
      );
    } else {
      // Add new availability entry
      doctor.availability.push({ date: formattedDate, timeSlots });
    }

    await doctor.save();

    res.status(200).json({
      message: "Availability updated successfully",
      availability: doctor.availability,
    });
  } catch (err) {
    res
      .status(500)
      .json({ message: "Error adding availability", error: err.message });
  }
};

// GET: Get availability of a doctor
const getAvailability = async (req, res) => {
  try {
    const doctor = await Doctor.findById(req.params.id).select("availability");
    if (!doctor) return res.status(404).json({ message: "Doctor not found" });

    res.status(200).json(doctor.availability);
  } catch (err) {
    res
      .status(500)
      .json({ message: "Error fetching availability", error: err.message });
  }
};

const getDoctorByUserId = async (req, res) => {
  try {
    const doctor = await Doctor.findOne({ user: req.params.userId });
    if (!doctor) {
      console.log("Doctor not found");
      return res.status(404).json({ message: "Doctor not found" });
    }
    res.status(200).json(doctor);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: error.message });
  }
};

module.exports = {
  getDoctors,
  addDoctor,
  approveDoctor,
  rejectDoctor,
  getDoctorById,
  deleteDoctor,
  addAvailability, // 👈 added availability route
  getAvailability, // 👈 added availability route
  getDoctorByUserId,
};
