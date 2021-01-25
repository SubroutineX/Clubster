require("dotenv").config();
const express = require("express");
const app = express();
const jwt = require("jsonwebtoken");
const mongoose = require("mongoose");
const users = require("./models/users_model");
const bcrypt = require("bcrypt");
const bodyParser = require("body-parser");

//database connection
var mongoDB =
    "mongodb+srv://admin:" +
    process.env.mongoDB +
    "@cluster0.hed3w.mongodb.net/WorkFlow?retryWrites=true&w=majority";
mongoose.connect(mongoDB, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.json());


app.listen(process.env.AUTH_PORT);
