const _ = require('lodash');
const Doctor = require('../models/Doctor');
const Request = require('../models/Request')
const config = require('config');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');



// create doctor
exports.createDoctor = async (req, res, next) => {
    const { name, email, password, speciality } = req.body;
    if (_.isNil(name) || _.isNil(email) || _.isNil(password) || _.isNil(speciality)) {
        return res.status(400).json({ message: "mandatory field missing" })
    }
    try {

        let doctor = await Doctor.findOne({ email: email });
        if (doctor) {
            return res.status(400).json({ message: "User already exists" })
        }
        doctor = new Doctor({ name, email, password, speciality });

        const salt = await bcrypt.genSalt(10);
        doctor.password = await bcrypt.hash(password, salt);
        await doctor.save();
        const tokenPayload = {
            doctor: {
                id: doctor.id
            }
        }
        jwt.sign(tokenPayload, config.jwtSecret, { expiresIn: 360000 }, (err, token) => {
            if (err) throw err;
            return res.status(200).json({ message: "successfully created user", token: token })
        })
    } catch (err) {
        console.log(err);
        return res.status(500).json({ message: "Server error" })
    }
}

// sign in doctor 
exports.loginDoctor = async (req, res, next) => {
    const { email, password } = req.body;
    try {
        if (_.isNil(email) || _.isNil(password)) {
            return res.status(400).json({ message: "mandatory field missing" });
        }
        let doctor = await Doctor.findOne({ email });
        if (!doctor) {
            return res.json(404).json({ message: "User not registered" })
        }
        const isMatch = await bcrypt.compare(password, doctor.password);
        if (!isMatch) {
            return res.status(400).json({ message: "Invalid Credentials" });
        }
        const tokenPayload = {
            doctor: {
                id: doctor.id
            }
        }
        jwt.sign(tokenPayload, config.jwtSecret,
            { expiresIn: 360000 }, (err, token) => {
                if (err) throw err;
                return res.status(200).json({ message: 'Login successful', token });
            })

    } catch (err) {
        console.log(err);
        return res.json(500).json({ message: "Server error" });

    }
}

// find all doctors
exports.getDoctors = async (req, res, next) => {
    try {
        const doctors = await Doctor.find({}, { name: 1, email: 1, id: 1, speciality: 1 });
        return res.status(200).json({ doctors });
    }
    catch (err) {
        console.log(err);
        return res.status(500).json({ message: "Server error" })
    }
}

// get pending requests 
exports.getPendingRequests = async (req, res, next) => {
    try {
        const requests = await Request.find({ doctor: req.doctor.id, isApproved: false });
        return res.status(200).json(requests);

    } catch (err) {
        console.log(err);
        return res.status(500).json({ message: "Server error" })

    }
}

// get approved requests 
exports.getApprovedRequests = async (req, res, next) => {
    try {
        const requests = await Request.find({ doctor: req.doctor.id, isApproved: true });
        return res.status(200).json(requests);

    } catch (err) {
        console.log(err);
        return res.status(500).json({ message: "Server error" })

    }

}

// approve a request 
exports.approveRequest = async (req, res, next) => {
    const { request } = req.body;
    if (_.isNil(request)) return res.status(400).json({ message: "mandatory variable missing" });
    try {
        const requestObject = await Request.findOne({ _id: request, doctor: req.doctor.id });
        if (!requestObject) {
            return res.status(404).json({ message: "request not found" })
        }
        if (requestObject.isApproved) {
            return res.status(400).json({ message: "request already approved" })
        }
        requestObject.isApproved = true;
        await requestObject.save()
        return res.status(200).json({ message: "successfully approved the request" })
    } catch (err) {
        console.log(err);
        return res.status(500).json({ message: "Server error" })
    }
}