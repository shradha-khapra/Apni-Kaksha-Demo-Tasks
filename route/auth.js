const express=require('express');
const router=express.Router();
const uuid=require('uuid');
const db=require('../utility/connnection');

//API for Patient sign up
router.post('/signupPatient',(req,res)=>{
    
    const {name,phone,password,problem}=req.body;
    
    if(!phone || !password || !name || !problem){
        return  res.status(422).json({error:"plase add all the field"})
    }

    const id=uuid.v4();
    const entityObj={id,name,phone,password,problem};

    //insert patient sign in data into patient database
    db.query(`INSERT INTO patient SET?`, entityObj, function (err, result) {
        if (err) {
            res.json({message:"phone number already registered"}); 
        } else {
            res.json({message:"succesfull added into database"});    
        }
    });
})

//API for Patient sign in
router.post('/siginPatient',(req,res)=>{
    
    const {phone,password}=req.body;
    //fetching registered phone data in database present or not if not then send msg for registration
    db.query(`select * from patient where phone=${phone}`,function (err, result){
        if (err) {
            console.log(err);
        } else {

            if(result[0]==undefined){
                res.json({message:"Phone number not registered!!"});
            }

            else if(result[0].password==password){
                // fetching all doctor data and send to frontedn side
                db.query(`select id, name, specialization, phone from doctor`,function (err, result){
                   if(err){
                      console.log(err);
                   }else{
                    res.json({status:200,message:"successfully sign in",doctorDetials:result});
                   }
                })
            
            }else{
                res.json({message:"password is wrong"});
            }
        }

        
    })

})

//API for Doctor sign up
router.post('/signupDoctor',(req,res)=>{
    
    const {name,phone,password,specialization}=req.body;
    
    if(!phone || !password || !name || !specialization){
        return  res.status(422).json({error:"plase add the all the field"})
    }

    const id=uuid.v4();
    const entityObj={id,name,phone,password,specialization};

    db.query(`INSERT INTO doctor SET?`, entityObj, function (err, result) {
        if (err) {
            res.json({message:"phone number already registered"});    
        } else {
            res.json({message:"succesfull added into database"});    
        }
    });


})

//API for Doctor sign in
router.post('/siginDoctor',(req,res)=>{
    
    //Get data doctor details for sign in
    const {phone,password}=req.body;

    //fetching registered phone data in database present or not if not then send msg for registration
    db.query(`select * from doctor where phone=${phone}`,function (err, result){
        if (err) {
            console.log(err);
        } else {

            if(result[0]==undefined){
                res.json({message:"Phone number not registered!!"});
            }
            
            else if(result[0].password==password){
                //if match password then send doctor detail
                db.query(`select id, name, specialization, phone from doctor where phone=${phone}`,function (err, result){
                   if(err){
                      console.log(err);
                   }else{
                    res.json({status:200,message:"successfully sign in",doctorDetials:result});
                   }
                })
            
            }else{
                res.json({message:"password is wrong"});
            }
        }

        
    })

})

module.exports= router;