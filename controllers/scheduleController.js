const moment = require('moment');
const Schedule = require("../models/Schedule");

let getScheduleById = (req, res) => {
  Schedule.findById(req.params.id)
    .then((schedule) => {
      if (!schedule) return res.status(404).json({ message: "Schedule not found" });
      res.json(schedule);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getScheduleByDoctorId = (req, res) => {
  Schedule.find({ doctorId: req.params.doctorId })
    .then((schedules) => res.json(schedules))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllSchedules = (req, res) => {
  Schedule.find()
    .then((schedules) => res.json(schedules))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createSchedule = (req, res) => {
  const newSchedule = new Schedule(req.body);
  newSchedule
    .save()
    .then((schedule) => res.status(201).json(schedule))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let updateSchedule = (req, res) => {
  Schedule.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((schedule) => {
      if (!schedule) return res.status(404).json({ message: "Schedule not found" });
      res.json(schedule);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let deleteSchedule = (req, res) => {
  Schedule.findByIdAndDelete(req.params.id)
    .then((schedule) => {
      if (!schedule) return res.status(404).json({ message: "Schedule not found" });
      res.json({ message: "Schedule deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let updateWeeklySchedule = (req, res) => {
  const { weeklySchedule } = req.body;
  if (!weeklySchedule) return res.status(400).json({ message: "weeklySchedule is required" });

  Schedule.findByIdAndUpdate(
    req.params.id,
    { weeklySchedule },
    { new: true }
  )
    .then(schedule => {
      if (!schedule) return res.status(404).json({ message: "Schedule not found" });
      res.json(schedule);
    })
    .catch(err => res.status(400).json({ message: err.message }));
};

const updateExceptionByDate = (req, res) => {
  const { date, timeSlots } = req.body;

  if (!date || !Array.isArray(timeSlots)) {
    return res.status(400).json({ message: "Date and timeSlots array are required" });
  }

  Schedule.findById(req.params.id)
    .then(schedule => {
      if (!schedule) return res.status(404).json({ message: "Schedule not found" });

      const dateStr = new Date(date).toISOString().slice(0, 10);

      let found = false;

      schedule.exceptions = schedule.exceptions.map((ex) => {
        if (ex.date.toISOString().slice(0, 10) === dateStr) {
          found = true;
          return { ...ex.toObject(), timeSlots };
        }
        return ex;
      });

      if (!found) {
        schedule.exceptions.push({ date, timeSlots });
      }

      return schedule.save();
    })
    .then(updated => res.json(updated))
    .catch(err => res.status(400).json({ message: err.message }));
};

let deleteAllExceptions = (req, res) => {
  Schedule.findByIdAndUpdate(
    req.params.id,
    { exceptions: [] },
    { new: true }
  )
    .then(schedule => {
      if (!schedule) return res.status(404).json({ message: "Schedule not found" });
      res.json(schedule);
    })
    .catch(err => res.status(400).json({ message: err.message }));
};


let deleteExceptionByDate = (req, res) => {
  const { date } = req.body;
  if (!date) return res.status(400).json({ message: "Date is required" });

  Schedule.findById(req.params.id)
    .then(schedule => {
      if (!schedule) return res.status(404).json({ message: "Schedule not found" });

      schedule.exceptions = schedule.exceptions.filter(
        ex => ex.date.toISOString().slice(0,10) !== new Date(date).toISOString().slice(0,10)
      );

      return schedule.save();
    })
    .then(schedule => res.json(schedule))
    .catch(err => res.status(400).json({ message: err.message }));
};

let deleteAllWeeklySchedule = (req, res) => {
  Schedule.findByIdAndUpdate(
    req.params.id,
    { weeklySchedule: {} },
    { new: true }
  )
    .then(schedule => {
      if (!schedule) return res.status(404).json({ message: "Schedule not found" });
      res.json(schedule);
    })
    .catch(err => res.status(400).json({ message: err.message }));
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


let getTimeSlotAvailableForAppointment = async (req, res) => {
  try {
    const { doctorId, date } = req.body;
    if (!doctorId || !date) {
      return res.status(400).json({ message: "doctorId, date, and timeSlot are required" });
    }

    const requestedDate = moment(date);
    if (!requestedDate.isValid()) {
      return res.status(400).json({ message: "Invalid date format" });
    }

    const schedule = await Schedule.findOne({ doctorId });
    if (!schedule) {
      return res.status(404).json({ message: "Schedule not found for this doctor" });
    }

    const dayOfWeek = requestedDate.format("dddd").toLowerCase(); // monday, tuesday, ...

    const exception = schedule.exceptions.find((ex) =>
      moment(ex.date).isSame(requestedDate, "day")
    );

    const availableSlots = exception ? exception.timeSlots : (schedule.weeklySchedule?.[dayOfWeek] || []);


    res.json({ availableSlots });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
};


module.exports = {
  getScheduleById,
  getScheduleByDoctorId,
  getAllSchedules,
  createSchedule,
  updateSchedule,
  deleteSchedule,
  deleteAllWeeklySchedule,
  getAllAvailableDoctors,
  getAllAvailableDoctorsByDate,
  getTimeSlotAvailableForAppointment,
  deleteExceptionByDate,
  deleteAllExceptions,
  updateExceptionByDate,
  updateWeeklySchedule
};