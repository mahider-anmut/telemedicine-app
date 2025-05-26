const fs = require('fs');
const { uploadToCloudinary } = require('../services/cloudinaryService');

const uploadFile = async (req, res) => {
  if (!req.file) return res.status(400).json({ message: 'No file uploaded' });

  try {
    const url = await uploadToCloudinary(req.file.path);
    fs.unlinkSync(req.file.path); 
    res.json({ url });
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
};

module.exports = { uploadFile };
