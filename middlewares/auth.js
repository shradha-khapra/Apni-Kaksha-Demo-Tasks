const jwt = require('jsonwebtoken');
const Patient = require('../models/Patient');
const Doctor = require('../models/Doctor');
const config = require('config')

exports.verifyPatient = async (req, res, next) => {
    const token = req.header("x-auth-token");
    if (!token) {
        return res.status(401).json({ msg: "No token, authorization denied" });
    }
    try {
        const decoded = await jwt.verify(token, config.get("jwtSecret"));
        const patient = await Patient.findOne({ _id: decoded.patient.id });
        if (!patient) throw "User not found"
        req.patient = decoded.patient;
        next();
    } catch (err) {
        console.log(err)
        return res.status(401).json({ msg: "Token is not valid" });
    }
}

exports.verifyDoctor = async (req, res, next) => {
    const token = req.header("x-auth-token");
    if (!token) {
        return res.status(401).json({ msg: "No token, authorization denied" });
    }
    try {
        const decoded = jwt.verify(token, config.get("jwtSecret"));
        const doctor = await Doctor.findOne({ _id: decoded.doctor.id });
        if (!doctor) throw "User not found"
        req.doctor = decoded.doctor;
        next();
    } catch (err) {
        return res.status(401).json({ msg: "Token is not valid" });
    }

}