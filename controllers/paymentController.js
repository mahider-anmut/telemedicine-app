const axios = require('axios');

const Invoice = require('../models/Invoice');

const config = require('../config/config');

config

const initiatePayment = async (req, res) => {
    var {firstName,lastName,email,phone,appointmentId,price,paymentType,transactionId} = req.body


    
    

    const newInvoice = new Invoice(req.body);
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
    console.log(req.body);
    Invoice.findOneAndUpdate({transactionId: req.body.tx_ref}, {metaData: req.body,status:req.body.status}, { new: true })
    .then((invoice) => {
        if (!invoice) return res.status(404).json({ message: "Invoice not found" });
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

module.exports = { initiatePayment,paymentCallback,paymentStatusByAppointmentId,paymentStatusByTransactionId };