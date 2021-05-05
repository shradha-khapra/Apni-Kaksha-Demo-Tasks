const mongoose = require("mongoose");

const AppointmentSchema = new mongoose.Schema({
	patient: {
		type: mongoose.Schema.Types.ObjectId,
		ref: "User",
		required: true,
	},
	approve_status: {
		type: Boolean,
		default: false,
	},
	date_of_appointment: {
		type: Date,
		required: true,
	},
	doctor: {
		type: mongoose.Schema.Types.ObjectId,
		ref: "User",
		// required: true,
	},
	creat_timestamp: {
		type: Date,
		required: true,
		default: Date.now,
	},
});

const User = mongoose.model("Appointment", AppointmentSchema);

module.exports = User;
