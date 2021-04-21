const userService = require("../services/user.service");

function authenticate(req, res, next) {
  userService
    .authenticate(req.body)
    .then((user) =>
      res.json({ data: user, message: "User Sucessfully logged in" })
    )
    .catch(next);
}

function register(req, res, next) {
  userService
    .create(req.body)
    .then((user) =>
      res.json({ message: "User Sucessfully logged in", data: user })
    )
    .catch(next);
}

module.exports = {
  authenticate,
  register,
};
