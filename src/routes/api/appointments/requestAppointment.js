const express = require("express");
const router = express.Router();
const passport = require("passport");
const Appointment = require("../../../model/Appointment");
const User = require("../../../model/User");

// GET Reqest to open the frontend of APpointment Request
router.get(
	"/",
	passport.authenticate("jwt", {
		session: false,
		failureRedirect: "./login",
	}),
	(req, res) => {
		if (req.user.role === "DOCTOR") {
			res.redirect("/api/user");
			return;
		}
		User.find({ role: "DOCTOR" })
			.then((doctors) => {
				res.render("requestAppointments", { doctors });
			})
			.catch((err) => console.log(err));
	}
);

router.post(
	"/",
	passport.authenticate("jwt", {
		session: false,
		failureRedirect: "./login",
	}),
	(req, res) => {
		if (req.user.role === "DOCTOR") {
			return;
		} else {
			const new_appointment = new Appointment({
				date_of_appointment: req.body.dateandtime,
				patient: req.user.id,
				doctor: req.body.doctor,
			});
			new_appointment
				.save()
				.then((appointment) => {
					if (appointment)
						User.find({ role: "DOCTOR" })
							.then((doctors) => {
								res.render("requestAppointments", {
									doctors,
									msg: "Appointment Successfullly Booked.",
								});
							})
							.catch((err) => console.log(err));
				})
				.catch((err) => console.log(err));
		}
	}
);

module.exports = router;
