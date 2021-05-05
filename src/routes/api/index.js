const express = require("express");
const router = express.Router();

// Importing routes
const signupRoutes = require("./users/signup");
const loginRoutes = require("./users/login");
const userRoutes = require("./users/dashboard")

router.use("/signup", signupRoutes);
router.use("/login", loginRoutes);
router.use("/user", userRoutes);

module.exports = router;
