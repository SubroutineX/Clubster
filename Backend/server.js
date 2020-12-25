if (process.env.NODE_ENV !== "production") {
    require("dotenv").config();
}
const express = require("express");
const app = express();
const PORT = process.env.PORT || 8000;
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const path = require("path");

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: false }));
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

//database connection
var mongoDB =
    "mongodb+srv://admin:" +
    process.env.mongoDB +
    "@cluster0.hed3w.mongodb.net/WorkFlow?retryWrites=true&w=majority";
mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true });

//helpers
const authenticateToken = require("./helpers/authenticate_token");

//controllers:-
const registerUser = require("./controllers/register_user.js");
const registerClub = require("./controllers/register_club");

//Routes
app.get("/", authenticateToken, (req, res) => {
    // res.render("index.ejs");
    res.status(200).send("hello");
});
app.post("/register", registerUser);
app.post("/registerClub", registerClub);

app.listen(PORT);
