const express = require("express");
const router = express.Router();

// Importing routes
const signupRoutes = require("./users/signup");
const loginRoutes = require("./users/login");
const userRoutes = require("./users/dashboard")
const requestAppointmentRoutes = require("./appointments/requestAppointment")
const requestedAppointmentsRoutes = require("./appointments/requestedAppointments")

router.use("/signup", signupRoutes);
router.use("/login", loginRoutes);
router.use("/user", userRoutes);
router.use("/requestAppointment",requestAppointmentRoutes);
router.use("/requestedAppointments",requestedAppointmentsRoutes);

module.exports = router;
