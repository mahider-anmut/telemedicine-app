const mongoose = require("mongoose");

const invoiceSchema = new mongoose.Schema(
  {
    appointmentId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Appointment",
      required: true,
    },
    price: {
      type: Number,
      required: true,
    },
    status: {
      type: String,
      enum: ["paid", "unpaid", "cancelled","success"],
      default: "unpaid",
    },
    transactionId: {
      type: String,
      required: true,
    },
    metaData: {
      type: Object,
      required: false,
    },
    paymentType: {
      type: String,
      enum: ["chapa", "telebirr"],
      required: true,
    },
  },
  {
    timestamps: true,
    versionKey: false,
  }
);

module.exports = mongoose.model("Invoice", invoiceSchema);
