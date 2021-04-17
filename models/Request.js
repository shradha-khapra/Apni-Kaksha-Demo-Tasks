const mongoose = require('mongoose');

const requestSchema = mongoose.Schema({
    patient: {
        type: mongoose.Types.ObjectId,
        refs: 'patients',
        required: true
    },
    doctor: {
        type: mongoose.Types.ObjectId,
        refs: 'doctors',
        required: true
    },
    isApproaved: {
        type: Boolean,
        default: false
    },
    description: {
        type: String,
    },
    start: {
        type: Date,
        required: true
    },
    end: {
        type: Date,
        required: true
    }
})
module.exports = mongoose.model("request", requestSchema);