const mongoose = require('mongoose');

const doctorSchema = mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        unique: true,
    },
    password: {
        type: String,
        required: true
    },
    speciality: {
        type: String,
        required: true
    },
    requests: [{
        type: mongoose.Types.ObjectId,
        ref: 'requests'
    }]
})

module.exports = mongoose.model("doctor", doctorSchema);