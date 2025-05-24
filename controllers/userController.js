const User = require("../models/User");
const Schedule = require("../models/Schedule");
const Statistics = require("../models/Statistics");

const Utils = require("../utils/utils");
const Email = require("../services/mailService");
const MedicalProfile = require("../models/MedicalProfile");

let getUserById = (req, res) => {
  User.findById(req.params.id)
    .then((user) => {
      if (!user) return res.status(404).json({ message: "User not found" });
      res.json(user);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getUsersByRole = (req, res) => {
  User.find({ role: req.params.role })
    .then((users) => res.json(users))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllUsers = (req, res) => {
  User.find()
    .then((users) => res.json(users))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createUser = async (req, res) => {
  try {
    const { role, email, ...userData } = req.body;

    let userRole = 'patient';
    const isAdmin = req.role === 'admin';

    if (isAdmin) {
      if (role && ['doctor', 'admin', 'patient'].includes(role)) {
        userRole = role;
      }
    } else {
      if (role && role !== 'patient') {
        return res.status(403).json({ message: 'You are not authorized to assign this role' });
      }
    }

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ message: 'User already exists' });
    }

    let passwordToSet = userData.password;

    if (userRole === 'doctor' && isAdmin) {
      passwordToSet = Utils.generateRandomPassword();
    }

    const newUser = new User({
      email,
      role: userRole,
      password: passwordToSet,
      ...userData,
    });

    await newUser.save();

    if (userRole === 'doctor' && isAdmin) {
      await Email.sendMail(
        newUser.email,
        'Your account has been created',
        `Your password is ${passwordToSet}`,
        `<p>Your password is <strong>${passwordToSet}</strong></p>`
      );
    }

    res.status(201).json(newUser);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};


let updateUser = (req, res) => {
  User.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((user) => {
      if (!user) return res.status(404).json({ message: "User not found" });
      res.json(user);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let deleteUser = (req, res) => {
  User.findByIdAndDelete(req.params.id)
    .then((user) => {
      if (!user) return res.status(404).json({ message: "User not found" });
      res.json({ message: "User deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllAvailableDoctors = async (req, res) => {
  try {
    const schedules = await Schedule.find();

    const availableSchedules = schedules.filter(schedule => {
      const days = Object.keys(schedule.weeklySchedule || {});
      for (let day of days) {
        const slots = schedule.weeklySchedule[day];
        if (slots && slots.length > 0) {
          return true;
        }
      }
      return false;
    });

    const doctorIds = availableSchedules.map(s => s.doctorId);

    const doctors = await User.find({ _id: { $in: doctorIds }, role: 'doctor' });

    res.json(doctors);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

let getAllAvailableDoctorsByDate = async (req, res) => {
  try {
    const { date } = req.query;
    if (!date) return res.status(400).json({ message: "Date query parameter is required" });

    const requestedDate = moment(date);
    if (!requestedDate.isValid()) return res.status(400).json({ message: "Invalid date format" });

    const dayOfWeek = requestedDate.format('dddd').toLowerCase(); // e.g. 'monday'

    const schedules = await Schedule.find().populate('doctorId');

    const availableSchedules = schedules.filter(schedule => {
      const weeklySlots = schedule.weeklySchedule?.[dayOfWeek] || [];

      if (!weeklySlots.length) return false;

      const exception = schedule.exceptions.find(ex =>
        moment(ex.date).isSame(requestedDate, 'day')
      );

      const finalSlots = exception ? exception.timeSlots : weeklySlots;

      return finalSlots.length > 0;
    });

    const result = availableSchedules.map(schedule => ({
      doctor: schedule.doctorId,
      availableTimeSlots: (() => {
        const exception = schedule.exceptions.find(ex =>
          moment(ex.date).isSame(requestedDate, 'day')
        );
        return exception ? exception.timeSlots : schedule.weeklySchedule[dayOfWeek];
      })(),
    }));

    res.json(result);

  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

let getTopAvailableDoctors = async (req, res) => {
  try {
    const schedules = await Schedule.find();

    const availableSchedules = schedules.filter(schedule => {
      const days = Object.keys(schedule.weeklySchedule || {});
      for (let day of days) {
        const slots = schedule.weeklySchedule[day];
        if (slots && slots.length > 0) {
          return true;
        }
      }
      return false;
    });

    const doctorIds = availableSchedules.map(s => s.doctorId);

    const topStatistics = await Statistics.find({
      doctorId: { $in: doctorIds }
    })
      .sort({ avgRating: -1, totalReviews: -1 }) 
      .limit(10)
      .lean();

    const topDoctorIds = topStatistics.map(stat => stat.doctorId);

    const doctors = await User.find({ _id: { $in: topDoctorIds }, role: 'doctor' });
    const medicalProfiles = await MedicalProfile.find({ doctorId: { $in: topDoctorIds } }).lean();


    const doctorMap = doctors.reduce((acc, doc) => {
      acc[doc._id.toString()] = doc.toObject();
      return acc;
    }, {});

    const medicalProfileMap = medicalProfiles.reduce((acc, profile) => {
      acc[profile.doctorId.toString()] = profile;
      return acc;
    }, {});


    const topDoctors = topStatistics.map(stat => {
      const doc = doctorMap[stat.doctorId.toString()];
      const profile = medicalProfileMap[stat.doctorId.toString()];
      
      return {
        ...doc,
        _statistics: stat,
        _medicalProfile: profile || null
      };
    });

    res.json(topDoctors);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};

module.exports = {
  getUserById,
  getUsersByRole,
  getAllUsers,
  createUser,
  updateUser,
  deleteUser,
  getAllAvailableDoctors,
  getAllAvailableDoctorsByDate,
  getTopAvailableDoctors
};