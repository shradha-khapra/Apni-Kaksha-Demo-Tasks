const router = require('express').Router();
const patientController = require('../controllers/patient');
const { verifyPatient } = require('../middlewares/auth')

// create new patient
router.post('/', patientController.createPatient);


//login user
router.post('/login', patientController.loginPatient);

// create a request
router.post('/request', verifyPatient, patientController.createRequest);

//get pending request
router.get('/request/pending', verifyPatient, patientController.getPendingRequests);

// get approved request

router.get('/request/approved', verifyPatient, patientController.getApprovedRequests)


module.exports = router;