require("dotenv").config();
const express = require("express");
const app = express();
const path = require("path");
const passport = require("passport")
const mongoose = require("mongoose");

// Enviroment Varaibles
const PORT = process.env.PORT || 3000;
const DB_URI = process.env.DBURI;

// Connect to MongoDB
mongoose
	.connect(DB_URI, { useNewUrlParser: true, useUnifiedTopology: true })
	.then(() => console.log("MongoDB Connected"))
	.catch((err) => console.log("ERROR", err));

// Passport Middleware
app.use(passport.initialize())
// Configure JWT Strategy
require('./config/strategies/jwtstrategy')(passport)


// Setting up View Engine EJS
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "/views"));

// Express body parser
app.use(express.urlencoded({ extended: true }));

// Cookie Parser
app.use(require("cookie-parser")())

// Importing Routes
app.use("/api", require("./routes/api"));

app.get("/", (req, res) => {
	res.send("Test Route");
});

app.listen(PORT, () => console.log(`App is Running on port ${PORT}.....`));
