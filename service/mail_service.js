let nodemailer = require("nodemailer");
let config = require("../config/config");

var sendMail = (receiverEmail, subject, bodyText, bodyHtml) => {
  let transporter = nodemailer.createTransport({
    host: config.Mail.HOST,
    port: config.Mail.PORT,
    secure: false,
    auth: config.Mail.AUTH,
    tls: {
      rejectUnauthorized: false,
      ciphers: "SSLv3"
    }
  });

  let mailOptions = {
    from: config.Mail.FROM,
    to: receiverEmail,
    subject: subject,
    text: bodyText,
    html: bodyHtml
  };

  transporter.sendMail(mailOptions, (error, info) => {
    if (error) {
      console.log(error);
      return error;
    }
    console.log(info);
    return info;
  });
};


module.exports.sendMail = sendMail;