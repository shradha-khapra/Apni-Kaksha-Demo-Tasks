const { DataTypes } = require("sequelize");
const User = require("./user.model");

function model(sequelize) {
  const attributes = {
    age: { type: DataTypes.INTEGER, allowNull: true },
    gender: { type: DataTypes.STRING, allowNull: false },
  };

  const Patient = sequelize.define("Patient", attributes);
  Patient.belongsTo(User(sequelize));

  return Patient;
}

module.exports = model;
