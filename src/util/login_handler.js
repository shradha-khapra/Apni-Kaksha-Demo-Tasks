const jwt = require("jsonwebtoken");

const login_handler = (req, res, user) => {
	const payload = {
		id: user._id,
		name: user.name,
		email: user.email,
		role: user.role,
	};
	jwt.sign(
		payload,
		process.env.SECRET,
		{
			expiresIn: 3600,
		},
		(err, token) => {
			if (err) throw err;
			res.cookie("token", "Bearer " + token).render('./dashboard',{name: user.name});
		}
	);
};
module.exports = login_handler