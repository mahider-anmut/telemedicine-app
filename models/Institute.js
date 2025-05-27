const mongoose = require("mongoose");

const instituteSchema = new mongoose.Schema(
  {
    name: {
      type: String,
    },
    type: {
      type: String,
      enum: ["hospital", "pharmacy", "laboratory", "clinic", "other"],
      default: "other",
    },
    location: {
      name: {
        type: String,
      },
      address: {
        type: String,
      },
      coordinates: {
        type: [Number], 
        index: "2dsphere",
      },
    },
    image: {
      type: String
    },
    avgRating: {
      type: Number,
      min: 0,
      max: 5,
      default: 0,
    },
    totalReviews: {
      type: Number,
      default: 0,
    }
  },
  {
    timestamps: true,
    versionKey: false,
  }
);

module.exports = mongoose.model("Institute", instituteSchema);
