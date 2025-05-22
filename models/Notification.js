const mongoose = require("mongoose");

const messageSchema = new mongoose.Schema(
  {
    userId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    type: {
      type: String,
      enum: ["system", "promotion", "account","transaction"],
      default: "system",
    },
    title: {
      type: String
    },
    message: {
      type: String
    }
  },
  {
    timestamps: true,
    versionKey: false,
  }
);

module.exports = mongoose.model("Message", messageSchema);
