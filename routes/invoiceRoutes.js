const express = require("express");

const auth = require("../middlewares/authMiddleware");
const { getInvoiceById,getInvoiceByUserId,getAllInvoices,createInvoice,updateInvoice,deleteInvoice } = require('../controllers/invoiceController');

const router = express.Router();

router.get('/user/:userId', getInvoiceByUserId);
router.get('/:id', getInvoiceById);
router.get('/', getAllInvoices);
router.post('/', createInvoice);
router.put('/:id', updateInvoice);
router.delete('/:id', deleteInvoice);

export default router;