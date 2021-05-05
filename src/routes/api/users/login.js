const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
	res.render("login");
});

router.post("/", (req, res) => {
	console.log(req.body);
});

module.exports = router;
