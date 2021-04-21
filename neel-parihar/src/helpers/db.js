const config = require("../../config.js");
const mysql = require("mysql2/promise");
const { Sequelize } = require("sequelize");

async function initialize() {
  // create db if it doesn't already exist
  const { host, port, user, password, database } = config.database;
  const connection = await mysql.createConnection({
    host,
    port,
    user,
    password,
  });
  await connection.query(`CREATE DATABASE IF NOT EXISTS \`${database}\`;`);

  // connect to db
  const sequelize = new Sequelize(database, user, password, {
    dialect: "mysql",
  });

  // init models and add them to the exported db object
  db.User = require("../models/user.model.js")(sequelize);
  db.Patient = require("../models/patient.model")(sequelize);
  db.Doctor = require("../models/doctor.model")(sequelize);
  db.Appointment = require("../models/appointment.model")(sequelize);

  // sync all models with database
  await sequelize.sync();
}

initialize();

module.exports = db = {};
