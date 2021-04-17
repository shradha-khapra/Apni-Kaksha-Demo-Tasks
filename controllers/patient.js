const _ = require('lodash');
const Patient = require('../models/Patient');
const Doctor = require('../models/Doctor')
const Request = require('../models/Request');
const config = require('config');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');


// create patient
exports.createPatient = async (req, res, next) => {
    const { name, email, password, problem } = req.body;
    if (_.isNil(name) || _.isNil(email) || _.isNil(password) || _.isNil(problem)) {
        return res.status(400).json({ message: "mandatory field missing" })
    }
    try {

        let patient = await Patient.findOne({ email: email });
        if (patient) {
            return res.status(400).json({ message: "User already exists" })
        }
        patient = new Patient({ name, email, password, problem });

        const salt = await bcrypt.genSalt(10);
        patient.password = await bcrypt.hash(password, salt);
        await patient.save();
        const tokenPayload = {
            patient: {
                id: patient.id
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

// sign in patient 
exports.loginPatient = async (req, res, next) => {
    const { email, password } = req.body;
    try {
        if (_.isNil(email) || _.isNil(password)) {
            return res.status(400).json({ message: "mandatory field missing" });
        }
        let patient = await Patient.findOne({ email });
        if (!patient) {
            return res.json(404).json({ message: "User not registered" })
        }
        const isMatch = await bcrypt.compare(password, patient.password);
        if (!isMatch) {
            return res.status(400).json({ message: "Invalid Credentials" });
        }
        const tokenPayload = {
            patient: {
                id: patient.id
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




exports.createRequest = async (req, res, next) => {
    const { doctor, description, start, end } = req.body,
        patient = req.patient.id;
    try {
        if (_.isNil(doctor) || _.isNil(description) || _.isNil(start) || _.isNil(end)) {
            return res.status(400).json({ message: "mandatory field missing" });
        }
        let requestedDoctor = await Doctor.findOne({ _id: doctor });
        let requestPatient = await Patient.findOne({ _id: patient });
        let conflictingRequestQuery = {
            doctor: requestedDoctor.id,
            $or: [
                {
                    $and: [
                        {
                            start: { $lte: start }
                        },
                        {
                            end: { $gte: start }
                        }
                    ]
                },
                {
                    $and: [
                        {
                            start: { $lte: end }
                        },
                        {
                            end: { $gte: end }
                        }
                    ]
                }

            ]
        }
        let conflictingRequest = await Request.findOne(conflictingRequestQuery);
        if (conflictingRequest) {
            return res.status(400).json({ message: "time slot not available" });
        }
        let request = Request({ description, start, end, doctor: requestedDoctor.id, patient: requestPatient.id });
        requestPatient.requests.unshift(request.id);
        requestedDoctor.requests.unshift(request.id);
        await requestPatient.save();
        await requestedDoctor.save();
        await request.save();
        return res.status(200).json({ message: 'Successfully created a request' })

    } catch (err) {
        console.log(err);
        return res.json(500).json({ message: "Server error" });
    }
}

// get pending requests 
exports.getPendingRequests = async (req, res, next) => {
    try {
        const requests = await Request.find({ patient: req.patient.id, isApproved: false });
        return res.status(200).json(requests);

    } catch (err) {
        console.log(err);
        return res.status(500).json({ message: "Server error" })

    }
}

// get approved requests 
exports.getApprovedRequests = async (req, res, next) => {
    try {
        const requests = await Request.find({ patient: req.patient.id, isApproved: true });
        return res.status(200).json(requests);

    } catch (err) {
        console.log(err);
        return res.status(500).json({ message: "Server error" })
    }

}