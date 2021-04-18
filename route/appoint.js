const express=require('express');
const router=express.Router();
const db=require('../utility/connnection');


//API for booking appointment by patient
router.post('/appointBook',(req,res)=>{
    
    const {id_doctor,id_patient,name_patient,phone_patient,problem_patient}=req.body;

    
    if(!id_doctor || !id_patient || !name_patient || !phone_patient || !problem_patient){
        return  res.status(422).json({error:"plase add the all the field"})
    }

    const entityObj={id_doctor,id_patient,name_patient,phone_patient,problem_patient,status_patient:"pending"};

    db.query(`INSERT INTO appointment SET?`, entityObj, function (err, result) {
        if (err) {
            console.log(err);
        } else {
            res.json({message:"succesfull appointment assigned"});    
        }
    });
})

//API for update patient status by doctor 
router.post('/doctorAppointPending/:id_doctor/:id_id_patient',(req,res)=>{
    
    //here id of those whos doctor and patient id fetching data
    const id_doctor=req.params.id_doctor;
    const id_patient=req.params.id_id_patient;
    if(!id_doctor || !id_patient){
        return  res.status(422).json({error:"plase add the all the field"})
    }


     //update data from appointment status of patient by doctor to approved
    db.query(`update appointment set status_patient="approved" where id_doctor=? and id_patient=? `,[id_doctor,id_patient],function (err, result){
        if (err) {
            console.log(err);
        } else {
            res.json({message:"succesfull updated"});    
        }
    });

})

// API fetching doctor data which patient appointment pending
router.get('/doctorAppointPending/:id',(req,res)=>{
    
    
    //here id of those whos doctor fetching data
    const id_doctor=req.params.id;
    if(!id_doctor){
        return  res.status(422).json({error:"plase add the all the field"})
    }

     //fetching data from appointment database
    db.query(`select id_patient,name_patient,phone_patient,problem_patient from appointment where id_doctor=${id_doctor} and status_patient="pending"`,function (err, result){
        if (err) {
            console.log(err);
        } else {
            res.json({message:"succesfull fetch",pendingAppoint:result});    
        }
    });

})

// API fetching doctor data which patient appointment approved
router.get('/doctorAppointApproved/:id',(req,res)=>{
    
     //here id of those whos doctor fetching data
    const id_doctor=req.params.id;
    if(!id_doctor){
        return  res.status(422).json({error:"plase add the all the field"})
    }

    //fetching data from appointment database
    db.query(`select id_patient,name_patient,phone_patient,problem_patient from appointment where id_doctor=${id_doctor} and status_patient!="pending"`,function (err, result){
        if (err) {
            console.log(err);
        } else {
            res.json({message:"succesfull fetch",pendingAppoint:result});    
        }
    });

})


module.exports= router;