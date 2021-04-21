const { roles } = require("../../config");

function isPatient(req, res, next) {
  // check if user is patient
  if (req.user.role !== roles.patient)
    return res.status(401).json({ message: "User should be a patient" });

  next();
}
module.exports = isPatient;
