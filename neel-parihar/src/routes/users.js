const {
  authenticateSchema,
  registerSchema,
} = require("../validators/users");
const {
  authenticate,
  register,
} = require("../controllers/users.controller");

const express = require("express");
const router = express.Router();

// routes
router.post("/login", authenticateSchema, authenticate);
router.post("/signUp", registerSchema, register);

module.exports = router;
