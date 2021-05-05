const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");

const User = require("../../../model/User");

router.get("/", (req, res) => {
	res.render("login");
});

router.post("/", (req, res) => {
	const { email, password } = req.body;
	console.log(req.body);
	const errors = [];

	// Check if all required values are there
	if (!email || !password) {
		errors.push({ msg: "Fill in all fields" });
	}

	// If errors rerender the page with errors
	if (errors.length > 0) {
		console.log(errors);
		res.render("login", {
			errors,
			email,
		});
	}
	// Else redirect to home page
	else {
		// PASSED
		User.findOne({ email: email })
			.then((user) => {
				if (!user) {
					errors.push({ msg: "No user found with this email" });
					res.render("login", {
						errors,
						email,
					});
				} else {
					bcrypt
						.compare(password, user.password)
						.then((isMatch) => {
							if (isMatch) {
								res.send("User logged IN");
							} else {
								errors.push({
									msg: "Password does not match",
								});
								res.render("login", {
									errors,
									email,
								});
							}
						})
						.catch((err) => console.log(err));
				}
			})
			.catch((err) => console.log(err));
	}
});

module.exports = router;
