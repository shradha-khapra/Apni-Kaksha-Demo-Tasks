
==============================> Step 1:<========================
 Clone the Repo

==============================> Step 2:<========================

npm install

==============================> Step 3:<========================
* Create database with name "hospital" in your local machine

* Create all the table in your local machine in "hopital" databases, and for which tables schema persent in location:-utiliy/createtablesql

databases name:
 1.doctor
 2.patient
 3.appointment

 just copy and paste in mysql command line all the schema.

==============================> Step 4:<========================

change the connection.js config file password with you database password.

==============================> Step 5:<========================

run nodemon app.js

==============================> Step 6:<========================

#############   Make the api requeste by using postman according to APIs discription below ###############

APIs divided into two part in file location:- route/.. :-\
  1.auth.js
    In which there are 4 APIs :-
      1. signupPatient 
      2. signinPatient
      3. signupDoctor
      4. signinDoctor
  2.appoint.js
    In which there are 4 APIs :-
      1. appointBook
      2. doctorAppointPending/:id_doctor/:id_id_patient
      3. doctorAppointPending/:id
      4. doctorAppointApproved/:id
     
  

==============================> APIs Discriptions <========================

--------------------------------------------------
1.  signupPatient :-

    request:- POST

    url :- http://localhost:5000/signupPatient

    body{       
         "name":string,
        "phone":number,
        "password":string,
        "problem":string
    }
--------------------------------------------------

2.  signinPatient :-
    
    request:- POST

    url :- http://localhost:5000/signinPatient

    body{          
     "phone":number,
     "password":string
    }

--------------------------------------------------

3. signupDoctor :-

 request:- POST

    url :- http://localhost:5000/signupDoctor

    body{
      "name":string,
      "phone":number,
      "password":string,
      "specialization":string
     }

--------------------------------------------------

4. signinDoctor :-

    request:- POST

    url :- http://localhost:5000/signinDoctor

    body{          
     "phone":number,
     "password":string
    }

--------------------------------------------------

5. appointBook :-

  request:- POST

  url :- http://localhost:5000/appointBook

  body{
    "id_doctor":string,
    "id_patient":string,
    "name_patient":string,
    "phone_patient":number,
    "problem_patient":string
  }

--------------------------------------------------

6. doctorAppointPending/:id_doctor/:id_id_patient :-

 request :- POST

 url :- http://localhost:5000/doctorAppointPending/id_doctor/id_patient


--------------------------------------------------

7. doctorAppointPending/:id

 request: GET

 url:- http://localhost:5000/doctorAppointPending/doctor_id

--------------------------------------------------

8. doctorAppointApproved/:id

 request: GET

 url:- http://localhost:5000/doctorAppointApproved/doctor_id

--------------------------------------------------


===============================================> THANK YOU!! <==============================



