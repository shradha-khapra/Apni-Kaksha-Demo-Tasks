const express = require("express");
const router = express.Router();
const passport = require("passport");
const User = require("../../../model/User");

router.get(
	"/",
	passport.authenticate("jwt", { session: false,  failureRedirect:"./login" }),
	(req, res) => {
		res.render("dashboard",{user:req.user});
	}
);

module.exports = router;
