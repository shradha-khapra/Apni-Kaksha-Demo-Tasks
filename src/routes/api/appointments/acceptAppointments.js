const express = require("express");
const router = express.Router();
const passport = require("passport");
const Appointment = require("../../../model/Appointment");

router.post(
	"/:id",
	passport.authenticate("jwt", {
		session: false,
		failureRedirect: "./login",
	}),
	(req, res) => {
		if (req.user.role === "DOCTOR") {
			Appointment.findByIdAndUpdate(req.params.id, {
				approve_status: true,
			})
				.then((appointment) => {
					res.redirect("/api/requestedAppointments");
				})
				.catch((err) => console.log(err));
		} else {
			return;
		}
	}
);

module.exports = router;
