const express = require("express");
const dotenv = require("dotenv");
const helmet  = require('helmet'); 
const rateLimit  = require('express-rate-limit');
const cors = require("cors");

const connectDB = require("./config/db");
const config = require("./config/config.js");

const auth = require("./middlewares/authMiddleware");

const authRoutes = require("./routes/authRoutes");
const appointmentRoutes = require("./routes/appointmentRoutes");
const chatRoutes = require("./routes/chatRoutes");
const invoiceRoutes = require("./routes/invoiceRoutes");
const medicalProfileRoutes = require("./routes/medicalProfileRoutes");
const messageRoutes = require("./routes/messageRoutes");
const notificationRoutes = require("./routes/notificationRoutes");
const scheduleRoutes = require("./routes/scheduleRoutes");

dotenv.config();
connectDB();

const app = express();
app.use(cors());
app.use(express.json());

app.use(helmet()); 
app.use(rateLimit({
  windowMs: 5 * 60 * 1000,
  max: 100,
  message: 'Too many requests, please try again later',
}));

app.get("/", (req, res) => {
  res.send("TeleMedicine API is running...");
});

app.use("/api/auth", authRoutes);
app.use("/api/appointment", auth.isAuthenticated, appointmentRoutes);
app.use("/api/chat", auth.isAuthenticated, chatRoutes);
app.use("/api/invoice", auth.isAuthenticated, invoiceRoutes);
app.use("/api/medicalProfile", auth.isAuthenticated, medicalProfileRoutes);
app.use("/api/message", auth.isAuthenticated, messageRoutes);
app.use("/api/notification", auth.isAuthenticated, notificationRoutes);
app.use("/api/schedule", auth.isAuthenticated, scheduleRoutes);

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: 'Internal Server Error' });
});


app.listen(config.SERVER_PORT, () => console.log(`Server running on port ${config.SERVER_PORT}`));
