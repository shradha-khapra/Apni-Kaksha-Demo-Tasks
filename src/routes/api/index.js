const express = require("express");
const router = express.Router();

// Importing routes
const signupRoutes = require("./users/signup");
const logoutRoutes = require("./users/logout");
const loginRoutes = require("./users/login");
const userRoutes = require("./users/dashboard");
const requestAppointmentRoutes = require("./appointments/requestAppointment");
const requestedAppointmentsRoutes = require("./appointments/requestedAppointments");
const myAppointmentsRoutes = require("./appointments/myAppointments");
const acceptAppointmentsRoutes = require("./appointments/acceptAppointments");

router.use("/signup", signupRoutes);
router.use("/login", loginRoutes);
router.use("/logout", logoutRoutes);
router.use("/user", userRoutes);
router.use("/requestAppointment", requestAppointmentRoutes);
router.use("/requestedAppointments", requestedAppointmentsRoutes);
router.use("/acceptappointments", acceptAppointmentsRoutes);
router.use("/myappointments", myAppointmentsRoutes);

module.exports = router;
