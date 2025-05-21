const Appointment = require("../models/Appointment");

// Create new appointment
exports.createAppointment = async (req, res) => {
  try {
    const appointment = new Appointment({
      ...req.body,
      patientId: req.body.patientId || "000000000000000000000000", // temp fallback
    });

    const saved = await appointment.save();
    res.status(201).json(saved);
  } catch (err) {
    console.error("Create error:", err);
    res.status(500).json({ message: "Failed to create appointment" });
  }
};

// Get appointments for a patient
exports.getAppointmentsByUser = async (req, res) => {
  try {
    const patientId = req.query.patientId; // use req.user._id if using auth middleware
    const appointments = await Appointment.find({ patientId });
    res.json(appointments);
  } catch (err) {
    res.status(500).json({ message: "Failed to fetch appointments" });
  }
};

// Get appointments for a doctor
exports.getAppointmentsForDoctor = async (req, res) => {
  try {
    const { doctorId } = req.params;

    const appointments = await Appointment.find({ doctorId }).populate(
      "patientId",
      "name email"
    );
    res.json(appointments);
  } catch (err) {
    res.status(500).json({ message: "Failed to fetch doctor appointments" });
  }
};

// Doctor confirms or declines appointment
exports.updateAppointmentStatus = async (req, res) => {
  try {
    const { id } = req.params;
    const { status } = req.body;

    if (!["Confirmed", "Declined"].includes(status)) {
      return res.status(400).json({ message: "Invalid status" });
    }

    const appointment = await Appointment.findByIdAndUpdate(
      id,
      { status },
      { new: true }
    );

    if (!appointment) {
      return res.status(404).json({ message: "Appointment not found" });
    }

    res.json(appointment);
  } catch (err) {
    console.error("Status update error:", err);
    res.status(500).json({ message: "Failed to update status" });
  }
};

// Mark as paid
exports.markAppointmentAsPaid = async (req, res) => {
  try {
    const appointment = await Appointment.findById(req.params.id);
    if (!appointment) return res.status(404).json({ message: "Not found" });

    appointment.paymentStatus = "Paid";
    await appointment.save();
    res.json(appointment);
  } catch (err) {
    console.error("Payment error:", err);
    res.status(500).json({ message: "Failed to update payment" });
  }
};
