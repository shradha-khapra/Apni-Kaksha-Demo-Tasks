const { roles } = require("../../config");
const db = require("../helpers/db");

async function createAppointment(dateTimeStamp, doctorId, user) {
  const doctor = await db.User.findByPk(doctorId);

  if (!doctor || doctor.role !== roles.doctor) throw "Doctor not found";

  // save appointment
  const appointment = await db.Appointment.create({
    dateTimeStamp,
    doctorId,
    patientId: user.id,
    isAccepted: false,
  });

  return appointment.get();
}

async function acceptAppointment(appointmentId, user) {
  const appointment = await db.Appointment.findByPk(appointmentId);

  if (!appointment || appointment.doctorId !== user.id)
    throw "Appointment not found";

  // update appointment details
  appointment.isAccepted = true;
  await appointment.save();

  return appointment.get();
}

async function getAppointments(user) {
  let query = {};
  if (user.role === roles.doctor) {
    query.doctorId = user.id;
  } else {
    query.patientId = user.id;
    query.isAccepted = true;
  }

  // get all appointments
  const appointments = await db.Appointment.findAll({
    where: query,
  });

  return appointments;
}

async function getRequestedAppointments(user) {
  // get all appointments for particular user
  const appointments = await db.Appointment.findAll({
    where: { patientId: user.id },
  });

  return appointments;
}

module.exports = {
  createAppointment,
  acceptAppointment,
  getAppointments,
  getRequestedAppointments,
};
