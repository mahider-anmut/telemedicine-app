const Invoice = require("../models/Invoice");

let getInvoiceById = (req, res) => {
  Invoice.findById(req.params.id)
    .then((invoice) => {
      if (!invoice) return res.status(404).json({ message: "Invoice not found" });
      res.json(invoice);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getInvoiceByUserId = (req, res) => {
  Invoice.find({ userId: req.params.userId })
    .then((invoices) => res.json(invoices))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let getAllInvoices = (req, res) => {
  Invoice.find()
    .then((invoices) => res.json(invoices))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let createInvoice = (req, res) => {
  const newInvoice = new Invoice(req.body);
  newInvoice
    .save()
    .then((invoice) => res.status(201).json(invoice))
    .catch((err) => res.status(400).json({ message: err.message }));
};

let updateInvoice = (req, res) => {
  Invoice.findByIdAndUpdate(req.params.id, req.body, { new: true })
    .then((invoice) => {
      if (!invoice) return res.status(404).json({ message: "Invoice not found" });
      res.json(invoice);
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

let deleteInvoice = (req, res) => {
  Invoice.findByIdAndDelete(req.params.id)
    .then((invoice) => {
      if (!invoice) return res.status(404).json({ message: "Invoice not found" });
      res.json({ message: "Invoice deleted" });
    })
    .catch((err) => res.status(400).json({ message: err.message }));
};

module.exports = {
  getInvoiceById,
  getInvoiceByUserId,
  getAllInvoices,
  createInvoice,
  updateInvoice,
  deleteInvoice,
};
