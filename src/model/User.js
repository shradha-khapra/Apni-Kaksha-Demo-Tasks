const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema({
	name: {
		type: String,
		required: true,
	},
	email: {
		type: String,
		required: true,
	},
	role: {
		type: String,
		required: true,
		enum: ["DOCTOR", "PATIENT"],
	},
	password: {
		type: String,
		required: true,
	},
	creat_timestamp: {
		type: Date,
		required: true,
		default: Date.now,
	},
});

const User = mongoose.model("User", UserSchema);

module.exports = User;
