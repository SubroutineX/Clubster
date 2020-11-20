if (process.env.NODE_ENV !== "production") {
    require("dotenv").config();
}
const express = require("express");
const app = express();
const passport = require("passport");
const session = require("express-session");
const override = require("method-override");
const PORT = process.env.PORT || 8000;
const mongoose = require("mongoose");
const bodyParser = require("body-parser");

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.set("views", "./views");
app.use(express.urlencoded({ extended: false }));
app.use(
    session({
        secret: process.env.SESSION_SECRET,
        resave: false,
        saveUninitialized: false,
    })
);
app.use(passport.initialize());
app.use(passport.session());
app.use(override("_method"));
//database connection
var mongoDB = 'mongodb+srv://admin:'+process.env.mongoDB+'@cluster0.hed3w.mongodb.net/WorkFlow?retryWrites=true&w=majority';
mongoose.connect(mongoDB, {useNewUrlParser: true, useUnifiedTopology: true});

//controllers:-
const registerUser = require("./controllers/register_user.js");


const initializePassport = require("./helper/passport_config.js");
initializePassport(passport);



app.get("/", isAuthenticated, (req, res) => {
 res.status(200).send("hello");
});

app.post(
    "/login",
    isNotAuthenticated,(req,res,next) =>{

        passport.authenticate("local",(err,user,info)=>{
            if(err){
              
              return res.status(500).json({errors:err});
            }
            if(!user){
              return res.status(500).json(info);
            }
            req.logIn(user,function(err){
                if(err){
                    console.log(err);
                   return res.status(500).json({error:err});
                }
               return  res.status(200).json(user);
            })
        })(req,res,next);   
    
    
    });


app.post("/register", isNotAuthenticated,registerUser);

app.delete("/logout", (req, res) => {
    req.logOut();
    res.status(200).json({message:"logged out"});
});

function isAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return next();
    }
    res.status(500).json({message:"User not Authenticated"});
}

function isNotAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return  res.status(500).json({message:"Session already active"});
    }
    next();
}

app.listen(PORT);
