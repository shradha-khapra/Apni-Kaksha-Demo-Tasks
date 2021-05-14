const router = require('express').Router();
const doctorController = require('../controllers/doctor');
const { verifyDoctor } = require('../middlewares/auth')

// create new doctor
router.post('/', doctorController.createDoctor);

// get all doctors
router.get('/', doctorController.getDoctors);


//login user
router.post('/login', doctorController.loginDoctor);

//get pending requests
router.get('/request/pending', verifyDoctor, doctorController.getPendingRequests);

//get approved requests
router.get('/request/approved', verifyDoctor, doctorController.getApprovedRequests);

// appriove a request
router.put('/request/approve', verifyDoctor, doctorController.approveRequest);





module.exports = router;