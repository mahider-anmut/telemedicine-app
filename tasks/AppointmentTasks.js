const Appointment = require("../models/Appointment");

const expireOldAppointments = async () => {
  try {
    const now = new Date();

    const result = await Appointment.updateMany(
      {
        appointmentStatus: "pending",
        appointmentDate: { $lt: now },
      },
      { appointmentStatus: "expired" }
    );

    console.log(`Expired ${result.modifiedCount} old appointments`);
  } catch (error) {
    console.error("Error expiring appointments:", error.message);
  }
};

const expireNotPaidAppointments = async () => {
  try {
    const oneHourAgo = new Date(Date.now() - 60 * 60 * 1000); 

    const result = await Appointment.updateMany(
      {
        appointmentStatus: "waitingPayment",
        updatedAt: { $lt: oneHourAgo }
      },
      { appointmentStatus: "expired" }
    );

    console.log(`Expired ${result.modifiedCount} unpaid appointments (over 1 hour old).`);
  } catch (error) {
    console.error("Error expiring unpaid appointments:", error.message);
  }
};

module.exports = {expireOldAppointments, expireNotPaidAppointments};
