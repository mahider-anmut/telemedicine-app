const axios = require('axios');

const Invoice = require('../models/Invoice');
const Notification = require('../models/Notification');

const config = require('../config/config');
const Chat = require('../models/Chat');
const Appointment = require('../models/Appointment');

config

const initiatePayment = async (req, res) => {
    var {firstName,lastName,email,phone,appointmentId,price,paymentType,transactionId} = req.body

    var data = req.body;
    data.userId = req.id;

    const newInvoice = new Invoice(data);
      newInvoice
        .save()
        .then((invoice) => {
            axios.post(
            config.CHAPA.PAYMENT_INITIATE_URL,
            {
                amount: price,
                currency: 'ETB',
                email: email,
                first_name: firstName,
                last_name: lastName,
                phone_number: phone,
                tx_ref: transactionId,
                //callback_url: config.CHAPA.PAYMENT_CALLBACK_URL,
                return_url: config.CHAPA.PAYMENT_RETURN_URL,
                'customization[title]': 'Payment for Appointment Schedule',
                //'customization[description]': 'Payment for Appointment Schedule',
                'meta[hide_receipt]': 'false'
            },
            {
                headers: {
                Authorization: `Bearer ${config.CHAPA.SECRET_KEY}`,
                'Content-Type': 'application/json'
                }
            }
        ).then(response=>{
            var data = {
                message: response.data.message,
                status: response.data.status,
                data: {
                    checkout_url: response.data.data.checkout_url
                }
            };
            res.status(200).json(data);
        }).catch((err) => {
            res.status(400).json({ message: err.response?.data || err.message })
        });
            
        }).catch((err) => res.status(400).json({ message: err.message }));
};

const paymentCallback = async (req, res) => {
    // console.log(req.body);
    console.log(req.body.status,"req.body.status");
    console.log(req.body.tx_ref,"req.body.tx_ref");
    Invoice.findOneAndUpdate({transactionId: req.body.tx_ref}, {metaData: req.body,status:req.body.status}, { new: true }).populate('appointmentId')
    .then((invoice) => {
        if (!invoice) return res.status(404).json({ message: "Invoice not found" });
        console.log(invoice.userId,"invoice.userId");
        console.log(invoice.appointmentId._id,"invoice.appointmentId._id");
        
        var appointmentId = invoice.appointmentId._id.toString();
        Appointment.updateOne({"_id":appointmentId}, {appointmentStatus: "readyForSession"}, { new: true }).exec()
        
        Notification.create({
            userId: invoice.userId,
            type: "transaction",
            title: "Appointment Payment Status Updated",
            message: "your appointment payment status has been updated",
        });
        Chat.create({
            doctorId: invoice.appointmentId.doctorId,
            patientId: invoice.appointmentId.patientId,
            appointmentId:invoice.appointmentId._id,
            status: "open",
            lastMessage: "",
            unreadCount: 0
        });
        
        
        
        res.json(invoice);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
}

const paymentStatusByTransactionId = async (req, res) => {
    Invoice.findOne({transactionId: req.params.id})
    .then((invoice) => {
        if (!invoice) return res.status(404).json({ message: "Invoice not found" });
        res.json({status: invoice.status});
    })
    .catch((err) => res.status(400).json({ message: err.message }));
}

const paymentStatusByAppointmentId = async (req, res) => {
    Invoice.findOne({appointmentId: req.params.id})
    .then((invoice) => {
        if (!invoice) return res.status(404).json({ message: "Invoice not found" });
        res.json({status: invoice.status});
    })
    .catch((err) => res.status(400).json({ message: err.message }));
}

const paymentStatusByUserId = async (req, res) => {
    Invoice.find({userId: req.params.id})
    .then((invoice) => {
        if (!invoice) return res.status(404).json({ message: "Invoice not found" });
        var newInvoice = invoice.map(inv=>{
            return {status: inv.status, appointmentId: inv.appointmentId, transactionId: inv.transactionId,userId: inv.userId, price: inv.price, paymentType: inv.paymentType}
        });
        res.json(newInvoice);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
}

module.exports = { initiatePayment,paymentCallback,paymentStatusByAppointmentId,paymentStatusByTransactionId,paymentStatusByUserId };