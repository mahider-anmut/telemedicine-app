let jwt = require('jsonwebtoken');
let config = require('../config/config');

let isAuthenticated = (req,res,next) => {
	let bearerHeader = req.headers["authorization"];

	if(typeof bearerHeader !== 'undefined'){
		let bearer = bearerHeader.split(" ");
		let bearerToken = bearer[1];
		jwt.verify(bearerToken,config.JWT_SECRET,function(err,pass){
			if(err){
				res.status(401).send("Authentication Failed");
			}else{
				req.id = pass.id;
				req.role = pass.role;
				req.token = bearerToken
				next();
		    }
	  	});
	}else{
		res.status(401).send("Authentication Failed");
	}
}

let isUser = (req, res, next) => {
	if (req.id == req.params.userId){
		next();
	}else{
		res.status(403).send("Invalid User Token");
	}
}

let isAdmin = (req, res, next) => {
	if (req.role == "admin") {
		next();
	} else {
		res.status(403).send("Role Not Authorized");
	}
}

let isPatient = (req, res, next) => {
	if (req.role == "patient") {
		next();
	} else {
		res.status(403).send("Role Not Authorized");
	}
}

let isDoctor = (req, res, next) => {
	if (req.role == "doctor") {
		next();
	} else {
		res.status(403).send("Role Not Authorized");
	}
}

let isRole = (...roles) => (req, res, next) => {
  if (roles.includes(req.role)) {
    return next();
  }
  return res.status(403).json({ message: 'Role Not Authorized' });
};


module.exports.isAuthenticated = isAuthenticated;
module.exports.isUser = isUser;
module.exports.isPatient = isPatient;
module.exports.isAdmin = isAdmin;
module.exports.isDoctor = isDoctor;
module.exports.isRole = isRole;