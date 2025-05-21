module.exports = {
  APP_NAME: "Telemedicine",
  BASE_URL: "",
  SERVER_PORT: process.env.PORT,
  HASH_ROUND: 5,
  JWT_SECRET: process.env.JWT_SECRET,
  TOKEN_EXPIREDATE: 3000,
  DATABASE: {
    URI: process.env.MONGO_URI
  },
  SMS: {
    NEXMO_KEY: "",
    NEXMO_PASSWORD: ""
  },
  Mail: {
    FROM: '"Telemedicine.com" noreply.telemedicine.com',
    HOST: "smtp.gmail.com",
    PORT: 587,
    AUTH: {
      user: "",
      pass: ""
    }
  },
};