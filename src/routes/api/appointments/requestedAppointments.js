const express = require("express");
const router = express.Router();
const passport = require("passport");
const Appointment = require("../../../model/Appointment");

router.get(
	"/",
	passport.authenticate("jwt", { session: false,  failureRedirect:"./login" }),
	(req, res) => {
        const search={}
        if(req.user.role === "DOCTOR"){
            return
        }else{
            search.patient= req.user.id
        }
        Appointment.find(search).populate('doctor').then(
            appointments=>{
                    console.log(appointments)
                res.render("requestedAppointments",{appointments});
            }
        ).catch()
		
	}
);

module.exports = router;
