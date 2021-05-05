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
        query.search.approve_status = true
        Appointment.find(query.search).populate(query.populate).then(
            appointments=>{
                    console.log(appointments)
                res.render("myAppointments",{appointments,schema:query.schema,user:req.user});
            }
        ).catch()
		
	}
);

module.exports = router;
