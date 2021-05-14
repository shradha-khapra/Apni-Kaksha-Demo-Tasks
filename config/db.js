
const mongoose = require('mongoose');
const config = require('config');
const mongoURI = config.mongoURI;

const connectDb = async () => {
    try {
        await mongoose.connect(mongoURI, {
            useNewUrlParser: true,
            useUnifiedTopology: true,
            useCreateIndex: true,
            useFindAndModify: false,
        });
        console.log('Connected to DB');

    } catch (err) {
        console.log(err);
        return process.exit(0);
    }
}

module.exports = connectDb