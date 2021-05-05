const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
const passport = require("passport");
const login_handler = require('../../../util/login_handler')


const User = require("../../../model/User");

router.get(
	"/",

	(req, res) => {
		res.render("signup");
	}
);

router.post(
	"/",

	(req, res) => {
		const { name, email, role, password1, password2 } = req.body;
		const errors = [];

		// Check if all required values are there
		if (!name || !email || !password1 || !password2 || !role) {
			errors.push({ msg: "Fill in all fields" });
		}
		// Check if passwords match
		if (password1 != password2) {
			errors.push({ msg: "passwords do not match" });
		}
		// If errors rerender the page with errors
		if (errors.length > 0) {
			console.log(errors);
			res.render("signup", {
				errors,
				name,
				email,
				password1,
				password2,
				role,
			});
		}
		// Else redirect to home page
		else {
			// PASSED
			User.findOne({ email: email })
				.then((user) => {
					if (user) {
						errors.push({ msg: "Email already exists" });
						res.render("signup", {
							errors,
							name,
							email,
							password1,
							password2,
							role,
						});
					} else {
						const newUser = new User({
							name,
							email,
							role,
							password: password1,
						});
						// Encrypt password
						bcrypt.genSalt(10, (err, salt) => {
							if (err) {
								throw err;
							} else {
								bcrypt.hash(
									newUser.password,
									salt,
									(err, hash) => {
										if (err) {
											throw err;
										} else {
											newUser.password = hash;
											newUser
												.save()
												.then((user) => {
													console.log(user)
													login_handler(req,res,user)
												})
												.catch((err) =>
													console.log("ERROR", err)
												);
										}
									}
								);
							}
						});
					}
				})
				.catch((err) => console.log(err));
		}
	}
);

module.exports = router;
