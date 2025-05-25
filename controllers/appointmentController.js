const Appointment = require("../models/Appointment");
const { isTimeSlotAvailable } = require("../utils/scheduleUtils");

let getAppointmentById = (req, res) => {
  Appointment.findById(req.params.id)
    .then((appointment) => {
      if (!appointment) return res.status(404).json({ message: "Appointment not found" });
      res.json(appointment);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAppointmentByDoctorId = (req, res) => {
  Appointment.find({ doctorId: req.params.doctorId }).populate('_patient').populate('_doctor')
    .then((appointments) => res.json(appointments))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAppointmentByPatientId = (req, res) => {
  Appointment.find({ patientId: req.params.patientId }).populate('_doctor').populate('_patient')
    .then((appointments) => res.json(appointments))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllAppointments = (req, res) => {
  Appointment.find()
    .then((appointments) => res.json(appointments))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createAppointment = async (req, res) => {
  try {
    const { patientId, doctorId, appointmentDate, appointmentTime } = req.body;

    const date = new Date(appointmentDate);
    const time = new Date(appointmentTime);

    // const isAvailable = await isTimeSlotAvailable(doctorId, date, time);
    // if (!isAvailable) {
    //   return res.status(400).json({ message: "Doctor is not available at the selected time." });
    // }

    const conflict = await Appointment.findOne({
      appointmentDate: date,
      appointmentTime: time,
      $or: [{ doctorId }, { patientId }]
    });

    if (conflict) {
      return res.status(400).json({ message: "Time slot already booked by doctor or patient." });
    }

    const newAppointment = new Appointment(req.body);
    const appointment = await newAppointment.save();
    res.status(201).json(appointment);

  } catch (err) {
    res.status(400).json({ message: err.message });
  }
};

const updateAppointment = async (req, res) => {
  try {
    const { id } = req.params;
    const {
      patientId,
      doctorId,
      appointmentDate,
      appointmentTime,
    } = req.body;

    if (!doctorId || !patientId || !appointmentDate || !appointmentTime) {
      return res.status(400).json({ message: "Missing required fields" });
    }

    const timeSlot = new Date(appointmentTime).toTimeString().slice(0, 5);

    const isAvailable = await isTimeSlotAvailable(doctorId, appointmentDate, timeSlot);
    if (!isAvailable) {
      return res.status(400).json({ message: "Doctor is not available at this time slot" });
    }

    const conflict = await Appointment.findOne({
      _id: { $ne: id },
      appointmentDate: new Date(appointmentDate),
      appointmentTime: new Date(appointmentTime),
      $or: [{ doctorId }, { patientId }],
    });

    if (conflict) {
      return res.status(400).json({ message: "Time slot is already booked for doctor or patient" });
    }

    const updatedAppointment = await Appointment.findByIdAndUpdate(id, req.body, { new: true });

    if (!updatedAppointment) {
      return res.status(404).json({ message: "Appointment not found" });
    }

    res.json(updatedAppointment);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

const updateAppointmentStatus = async (req, res) => {
  try {
    const { id } = req.params;
    const {appointmentStatus} = req.body;

    const updatedAppointment = await Appointment.findByIdAndUpdate(id, {appointmentStatus}, { new: true });

    if (!updatedAppointment) {
      return res.status(404).json({ message: "Appointment not found" });
    }

    res.json(updatedAppointment);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

let deleteAppointment = (req, res) => {
  Appointment.findByIdAndDelete(req.params.id)
    .then((appointment) => {
      if (!appointment) return res.status(404).json({ message: "Appointment not found" });
      res.json({ message: "Appointment deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

module.exports = {
  getAppointmentById,
  getAppointmentByDoctorId,
  getAppointmentByPatientId,
  updateAppointmentStatus,
  getAllAppointments,
  createAppointment,
  updateAppointment,
  deleteAppointment,
};