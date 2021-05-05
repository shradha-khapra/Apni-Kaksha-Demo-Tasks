const express = require("express");
const router = express.Router();

// Importing routes
signupRoutes = require("./users/signup");
loginRoutes = require("./users/login");

router.use("/signup", signupRoutes);
router.use("/login", loginRoutes);

module.exports = router;
