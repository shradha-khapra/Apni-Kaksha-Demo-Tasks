const express = require("express");
const router = express.Router();

const passport = require("passport");


router.get(
	"/",
    passport.authenticate("jwt", { session: false,  failureRedirect:"./login" }),
	(req, res) => {
        res.clearCookie("token").redirect("/api/login")
    }
);

module.exports = router;
