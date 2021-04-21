const { DataTypes } = require("sequelize");
const User = require("./user.model");

function model(sequelize) {
  const attributes = {
    qualification: { type: DataTypes.STRING, allowNull: false },
    specialization: { type: DataTypes.STRING, allowNull: false }
  };

  
  const Doctor = sequelize.define("Doctor", attributes);

  Doctor.belongsTo(User(sequelize));
}

module.exports = model;
