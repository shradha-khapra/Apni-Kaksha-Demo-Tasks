const { secret } = require("../../config");
const { sign } = require("jsonwebtoken");
const { compare, hash: _hash } = require("bcryptjs");
const db = require("../helpers/db");

async function authenticate({ email, password }) {
  const user = await db.User.scope("withHash").findOne({ where: { email } });

  if (!user || !(await compare(password, user.hash)))
    throw "Email or password is incorrect";

  // authentication successful
  const token = sign({ sub: user.id }, secret, { expiresIn: "7d" });
  return { ...omitHash(user.get()), token };
}

async function create(params) {
  // validate
  if (await db.User.findOne({ where: { email: params.email } })) {
    throw 'Email "' + params.email + '" is already taken';
  }

  // hash password
  if (params.password) {
    params.hash = await _hash(params.password, 10);
  }

  // save user
  const user = await db.User.create(params);

  // create auth token
  const token = sign({ sub: user.id }, secret, { expiresIn: "7d" });
  return { ...omitHash(user.get()), token };
}

function omitHash(user) {
  const { hash, ...userWithoutHash } = user;
  return userWithoutHash;
}

module.exports = {
  authenticate,
  create,
};
