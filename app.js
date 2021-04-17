const express = require('express');
const app = express();
const connectDb = require('./config/db');
const PORT = process.env.PORT || 3000;

//connecting to DB
connectDb();

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