const express = require("express");
const bodyParser = require("body-parser");
const errorHandler = require("./helpers/error-handler");
const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// api routes
app.use("/api", require("./routes/users"));
app.use("/api", require("./routes/appoinments"));

// global error handler
app.use(errorHandler);

// start server
app.listen(4000, () => console.log("Server listening on port " + 4000));
