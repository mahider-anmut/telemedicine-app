const bcrypt = require("bcrypt");
const User = require("./models/User");
const config = require("../config/config");

async function initializeAdminUser() {
  const existingUsers = await User.countDocuments();
  if(process.env.INITIALIZE_ADMIN === "true" && existingUsers > 0) {
    console.warn("⚠️ INITIALIZE_ADMIN environment variable is set to true, but there are existing users in the database. Please remove INITIALIZE_ADMIN environment variable.\n");
    process.exit(1);
  }else if (existingUsers > 0){
    return;
  }else if (process.env.INITIALIZE_ADMIN === "true" && existingUsers === 0){ 
    const adminEmail = "admin-"+Math.random().toString(36).slice(-5)+"@"+config.APP_NAME.toLowerCase()+".com";
    const adminPassword =  Math.random().toString(36).slice(-10);

    const newAdmin = new User({
      firstName: "Admin",
      lastName: "Admin",
      email: adminEmail,
      role: "admin",
      password: await bcrypt.hash(adminPassword, 10),
    });

    await newAdmin.save();

    console.warn("\n✅ Admin user created!");
    console.warn(`🆔 Email: ${newAdmin.email}`);
    console.warn(`🔐 Password: ${adminPassword}`);
    console.warn("⚠️ Please change the password immediately and remove INITIALIZE_ADMIN environment variable.\n");
    process.exit(1);
  }
}
