const express = require('express');
const app = express();
const connectDb = require('./config/db');
const bodyParser = require('body-parser');
const cors = require('cors');
const PORT = process.env.PORT || 3000;

//apis 
const doctor = require('./apis/doctor')
const patient = require('./apis/patient')

// enabling cross origin requests
app.use(cors());

// body parsing
app.use(bodyParser({ extended: false }));

//connecting to DB
connectDb();


// doctors api
app.use('/api/doctor', doctor);

// patients api
app.use('/api/patient', patient);

app.get('/', (req, res, next) => {
    return res.send('Welcome to apni kaksha')
})

// listening to port 3000
app.listen(PORT, (err) => {
    if (err) {
        console.log(err);
        return process.exit(0);
    }
    console.log(`App is listening on port: ${PORT}`);
})