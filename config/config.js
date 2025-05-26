const dotenv = require("dotenv");
dotenv.config();

module.exports = {
  APP_NAME: "Telemedicine",
  API_URL: "https://telemedicine-back-end-production.up.railway.app",
  BASE_URL: "",
  FRONTEND_URL: "http://localhost:3000",
  SERVER_PORT: process.env.PORT || 5000,
  HASH_ROUND: 5,
  JWT_SECRET: process.env.JWT_SECRET,
  TOKEN_TIMEOUT: "7d",
  RESET_PASSWORD_TOKEN_TIMEOUT: 3600000, // 1 hour
  DATABASE: {
    URI: process.env.MONGO_URI
  },
  SMS: {
    NEXMO_KEY: "",
    NEXMO_PASSWORD: ""
  },
  MAIL: {
    FROM: process.env.SMTP_FROM,
    HOST: process.env.SMTP_HOST || "smtp.gmail.com",
    PORT: process.env.SMTP_PORT || 587,
    AUTH: {
      user: process.env.SMTP_USER,
      pass: process.env.SMTP_PASSWORD
    }
  },
  CLOUDINARY: { 
    CLOUD_NAME: process.env.CLOUDINARY_CLOUD_NAME,
    API_KEY: process.env.CLOUDINARY_API_KEY,
    API_SECRET: process.env.CLOUDINARY_API_SECRET,
  },
  CHAPA:{
    PAYMENT_INITIATE_URL: process.env.CHAPA_PAYMENT_INITIATE_URL,
    PUBLIC_KEY: process.env.CHAPA_PUBLIC_KEY,
    SECRET_KEY: process.env.CHAPA_SECRET_KEY,
    ENCRYPTION_KEY: process.env.CHAPA_ENCRYPTION_KEY,
    PAYMENT_RETURN_URL: process.env.CHAPA_RETURN_URL,
    PAYMENT_CALLBACK_URL: process.env.CHAPA_CALLBACK_URL
  }
};