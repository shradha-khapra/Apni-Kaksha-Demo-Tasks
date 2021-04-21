const appointmentService = require("../services/appointment.service");

function create(req, res, next) {
  appointmentService
    .createAppointment(req.body.dateTimeStamp, req.params.id, req.user)
    .then((data) =>
      res.json({ message: "Appoinment Requested Sucessfully", data })
    )
    .catch(next);
}

function accept(req, res, next) {
  appointmentService
    .acceptAppointment(req.params.id, req.user)
    .then((data) =>
      res.json({ message: "Appoinment Accepted Sucessfully", data })
    )
    .catch(next);
}

function getMyAppoinments(req, res, next) {
  appointmentService
    .getAppointments(req.user)
    .then((data) =>
      res.json({ message: "Appoinments Fetched Sucessfully", data })
    )
    .catch(next);
}

function getRequestedAppoinments(req, res, next) {
  appointmentService
    .getRequestedAppointments(req.user)
    .then((data) =>
      res.json({ message: "Appoinments Fetched Sucessfully", data })
    )
    .catch(next);
}

module.exports = { create, accept, getMyAppoinments, getRequestedAppoinments };
