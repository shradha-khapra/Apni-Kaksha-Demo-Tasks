const { roles } = require("../../config");

function isDoctor(req, res, next) {
  // check if user is doctor
  if (req.user.role !== roles.doctor)
    return res.status(401).json({ message: "User should be a doctor" });

  next();
}

module.exports = isDoctor;
