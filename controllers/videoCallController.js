const axios = require("axios");

const config = require("../config/config");
const Appointment = require("../models/Appointment");

let createVideoCallRoom = async () => {
  try {
    const roomName = `call-${Date.now()}`;
    const response = await axios.post(
      'https://api.daily.co/v1/rooms',
      {
        name: roomName,
        properties: {
          max_participants: 2,
          exp: Math.floor(Date.now() / 1000) + 60 * 30, // 30 minutes expiry
          enable_chat: true,
          enable_knocking: true,
          start_video_off: true,
        },
      },
      {
        headers: {
          Authorization: `Bearer ${config.DAILYCO_API_KEY}`,
          'Content-Type': 'application/json',
        },
      }
    );

    // res.json({ url: response.data.url });
    return response.data.url;
  } catch (err) {
    console.error(err.response?.data || err.message);
    // res.status(500).json({ error: 'Failed to create video call room' });
  }
};

let getAppointmentCallUrl = async (req, res) => {
    var appointmentId = req.params.id;
    if (!appointmentId) {
        return res.status(400).json({ error: 'Appointment ID is required' });
    }else{
        Appointment.findById(appointmentId)
        .then(async appointment => {
            if (!appointment) {
                return res.status(404).json({ error: 'Appointment not found' });
            }else if (!appointment.callUrl) {
                var callUrl = await createVideoCallRoom();
                
                appointment.callUrl = callUrl;
                appointment.save();
                res.json({ callUrl: appointment.callUrl });    
            }else{
              res.json({ callUrl: appointment.callUrl });
            }
        })
    }
};







module.exports = {
  getAppointmentCallUrl,
};