const {
  createAppoinmentSchema,
  acceptAppointmentSchema,
} = require("../validators/appoinments");
const {
  create,
  accept,
  getMyAppoinments,
  getRequestedAppoinments,
} = require("../controllers/appointments.controller");
const authorize = require("../middlewares/authorize");
const isPatient = require("../middlewares/isPatient");
const isDoctor = require("../middlewares/isDoctor");

const express = require("express");
const router = express.Router();

router.post(
  "/requestAppointment/:id",
  authorize(),
  isPatient,
  createAppoinmentSchema,
  create
);

router.post(
  "/acceptAppointment/:id",
  authorize(),
  isDoctor,
  acceptAppointmentSchema,
  accept
);

router.get("/myAppointments", authorize(), getMyAppoinments);

router.get(
  "/requestedAppointments",
  authorize(),
  isPatient,
  getRequestedAppoinments
);

module.exports = router;
