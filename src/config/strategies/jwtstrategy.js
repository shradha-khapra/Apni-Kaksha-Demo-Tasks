const JwtStrategy = require("passport-jwt").Strategy;
const ExtractJwt = require("passport-jwt").ExtractJwt;
const mongoose = require("mongoose");
const User = require("../../model/User");
const secret = process.env.SECRET;

var opts = {};
opts.jwtFromRequest = (req) => {
	if (req && req.cookies && req.cookies.token)
		return req.cookies.token.split(" ")[1];
	return false;
};
opts.secretOrKey = process.env.SECRET;

module.exports = (passport) => {
	passport.use(
		new JwtStrategy(opts, (jwt_payload, done) => {
			User.findById(jwt_payload.id)
				.then((user) => {
					console.log(user);
					if (user) {
						return done(null, user);
					}
					return done(null, false);
				})
				.catch((err) => console.log(err));
		})
	);
};
