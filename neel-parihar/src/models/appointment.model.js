const { DataTypes } = require("sequelize");

function model(sequelize) {
  const attributes = {
    dateTimeStamp: { type: DataTypes.DATE, allowNull: false },
    isAccepted: { type: DataTypes.BOOLEAN, default: false },
  };

  const Appointment = sequelize.define("Appointment", attributes);

  Appointment.belongsTo(db.User, {
    as: "doctor",
    foreignKey: "doctorId",
  });

  Appointment.belongsTo(db.User, {
    as: "patient",
    foreignKey: "patientId",
  });

  return Appointment;
}

module.exports = model;
