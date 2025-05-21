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

const updateAvailability = async (req, res) => {
  try {
    const { doctorId, availabilityId } = req.params;
    const { timeSlots } = req.body; // Expecting timeSlots array from the request

    if (!timeSlots || !Array.isArray(timeSlots) || timeSlots.length === 0) {
      return res.status(400).json({ message: "Invalid or missing time slots" });
    }

    // Validate that all time slots are valid strings
    for (const time of timeSlots) {
      if (typeof time !== "string" || !time.trim()) {
        return res.status(400).json({ message: `Invalid time slot: ${time}` });
      }
    }

    const doctor = await Doctor.findById(doctorId);
    if (!doctor) {
      return res.status(404).json({ message: "Doctor not found" });
    }

    const availability = doctor.availability.id(availabilityId);
    if (!availability) {
      return res.status(404).json({ message: "Availability not found" });
    }

    // Check if any of the time slots already exist
    for (const newTime of timeSlots) {
      if (availability.timeSlots.includes(newTime.trim())) {
        return res
          .status(400)
          .json({ message: `Time slot already exists: ${newTime}` });
      }
    }

    // Add new time slots to the availability
    availability.timeSlots.push(...timeSlots.map((time) => time.trim()));

    await doctor.save();

    res.status(200).json({
      message: "Time slots added successfully",
      availability: doctor.availability,
    });
  } catch (error) {
    console.error("Error updating availability:", error);
    res.status(500).json({ message: "Server error" });
  }
};

const deleteAvailability = async (req, res) => {
  const { doctorId, availabilityId } = req.params;

  console.log("doctorId:", doctorId);
  console.log("availabilityId:", availabilityId);

  try {
    // Find the doctor by ID
    const doctor = await Doctor.findById(doctorId);
    if (!doctor) {
      return res.status(404).json({ message: "Doctor not found" });
    }

    // Find the availability by availabilityId and remove it from the availability array
    const availabilityIndex = doctor.availability.findIndex(
      (avail) => avail._id.toString() === availabilityId
    );

    if (availabilityIndex === -1) {
      return res.status(404).json({ message: "Availability not found" });
    }

    // Remove the availability from the array
    doctor.availability.splice(availabilityIndex, 1);

    // Save the updated doctor document
    doctor.markModified("availability");
    await doctor.save();

    res.status(200).json({ message: "Availability removed successfully" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Server error" });
  }
};

// GET: Approved doctors with non-empty availability
const getAvailableDoctors = async (req, res) => {
  try {
    const doctors = await Doctor.find({
      availability: { $exists: true, $not: { $size: 0 } },
    }).select("name specialty profileImage availability");

    res.status(200).json(doctors);
  } catch (error) {
    res.status(500).json({ message: "Error fetching available doctors" });
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
  updateAvailability,
  deleteAvailability,
  getAvailableDoctors,
};
