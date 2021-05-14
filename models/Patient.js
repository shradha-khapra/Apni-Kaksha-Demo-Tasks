const mongoose = require('mongoose');

const patientSchema = mongoose.Schema({
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
    problem: {
        type: String,
        required: true
    },
    requests: [{
        type: mongoose.Types.ObjectId,
        ref: 'requests'
    }]
})

module.exports = mongoose.model("patient", patientSchema);