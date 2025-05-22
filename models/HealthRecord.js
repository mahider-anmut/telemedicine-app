const mongoose = require("mongoose");

const healthRecordSchema = new mongoose.Schema({
  medicalHistory: {
    type: String,
    enum: ["None", "Asthma", "Knee Surgery", "Diabetes", "Heart Disease", "Cancer", "Other"],
    default: "None",
  },
  currentMedications: {
    type: String,
    enum: ["None", "Inhaler", "Ibuprofen", "Aspirin", "Antidepressants", "Blood Pressure Medication", "Other"],
    default: "None",
  },
  allergies: {
    type: String,
    enum: ["None", "Peanuts", "Penicillin", "Pollen", "Dust", "Shellfish", "Other"],
    default: "None",
  },
  familyHistory: {
    type: String,
    enum: ["None", "Hypertension", "Diabetes", "Cancer", "Heart Disease", "Mental Illness", "Other"],
    default: "None",
  },
  vaccinations: {
    type: String,
    enum: ["None", "COVID-19", "Tetanus", "Flu", "Hepatitis B", "HPV", "Other"],
    default: "None",
  },
  lifestyle: {
    type: String,
    enum: ["None", "Active", "Sedentary", "Vegetarian", "Non-Vegetarian", "Vegan", "Other"],
    default: "None",
  },
  recentSymptoms: {
    type: String,
    enum: ["None", "Cough", "Fever", "Headache", "Shortness of Breath", "Fatigue", "Other"],
    default: "None",
  },
  mentalHealth: {
    type: String,
    enum: ["None", "Stable", "Anxiety", "Depression", "Bipolar Disorder", "Other"],
    default: "None",
  },
  physicalActivity: {
    type: String,
    enum: ["None", "Daily", "Weekly", "Occasionally", "Rarely", "Other"],
    default: "None",
  },
  dietaryPreferences: {
    type: String,
    enum: ["None", "Vegetarian", "Non-Vegetarian", "Vegan", "Keto", "Other"],
    default: "None",
  },
  smokingStatus: {
    type: String,
    enum: ["None", "Non-Smoker", "Occasional Smoker", "Regular Smoker", "Former Smoker", "Other"],
    default: "None",
  },
  alcoholConsumption: {
    type: String,
    enum: ["None", "Non-Drinker", "Occasional Drinker", "Regular Drinker", "Other"],
    default: "None",
  },
  otherInfo: {
    type: String,
    default: "",
  },
}, {
  timestamps: true,
  versionKey: false,
});

module.exports = mongoose.model("HealthRecord", healthRecordSchema);
