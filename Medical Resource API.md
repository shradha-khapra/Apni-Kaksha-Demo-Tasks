  

# Medical Resource API (FrontEnd Question)
<br/>

#### Candidates are required to use Node.JS with Mysql (recommedation to use Passport.js for Authentication and Sequalize.js for ORM)
<br/>

  *  *  *  *  *
### Requirements

- Initially you need to create Two types of User
	- Doctor
	- Patient
	
- Now first task is to create User/Patient Signup user same Endpoints for both data you just add a field like user/patient to change role.
    ### Authentication Endpoints
    -  #### POST api/signUp 
        > Signup will take necessary data for users and most important it will take users credential and role once the request get sucessfully we need a Token for authentication and a message saying "User Sucessfully logged in

    -  #### POST api/login
        > Login will take necessary users credential, once the request get sucessfully we need a Token for authentication and a message saying "User Sucessfully logged in"

    ### Other Endpoints
    - #### POST api/requestAppointment/:id
        **Only for patients**
        > This Endpoint will Post a request and Patient will send the date and time of the appointment

    -  #### POST api/acceptAppointment/:id
        **Only for doctors**
        > This endpoint will accept all the appointments that a user requested to doctors

    -  #### GET api/myAppointments 
        > This endpoint will show all the appointments made by user and accepted my doctor and for doctors it will show all the appointments made to that particular doctor

    -  #### GET api/requestedAppointments
        > This endpoint will show all the appointments made by users both to user and patient (user can see the requests they had made and patient can see there appointments)


Note:- 
- Please name you repository as Candidate name (like:- **yash-bothra**)
- It will be recommended if you commit as you are coding and developing the app.
- You can create any random demi data as you require. 
- We also expect to validate all the data which user is requesting (you can use Joi,Express-validate or any other package)

