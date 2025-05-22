const Schedule = require("../models/Schedule");
const moment = require("moment");

const isTimeSlotAvailable = async (doctorId, date, timeSlot) => {
  const requestedDate = moment(date);
  if (!requestedDate.isValid()) return false;

  const schedule = await Schedule.findOne({ doctorId });
  if (!schedule) return false;

  const dayOfWeek = requestedDate.format("dddd").toLowerCase(); // e.g. "monday"

  const exception = schedule.exceptions.find((ex) =>
    moment(ex.date).isSame(requestedDate, "day")
  );

  const availableSlots = exception
    ? exception.timeSlots
    : (schedule.weeklySchedule?.[dayOfWeek] || []);

  return availableSlots.includes(timeSlot);
};

module.exports = { isTimeSlotAvailable };
