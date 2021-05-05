const express = require("express");
const router = express.Router();
const passport = require("passport");
const Appointment = require("../../../model/Appointment");

router.get(
	"/",
	passport.authenticate("jwt", { session: false,  failureRedirect:"./login" }),
	(req, res) => {
        const query={}
        if(req.user.role === "DOCTOR"){
            query.search={doctor: req.user.id}
            query.populate='patient'
            query.schema='doctor'
        }else{
            query.search={patient: req.user.id}
            query.populate='doctor'
            query.schema='patient'
        }
        Appointment.find(query.search).populate(query.populate).then(
            appointments=>{
                    console.log(appointments)
                res.render("requestedAppointments",{appointments,schema:query.schema});
            }
        ).catch()
		
	}
);

module.exports = router;
