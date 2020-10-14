const LocalStrategy = require("passport-local").Strategy;
const bcrypt = require("bcrypt");
const users = require("../models/users_model");

function initialize(passport) {
    
    const authenticateUser = async (email, password, done) => { 
        try {
        const user = await users.findOne({email:email});
        
        
        if (user == null) {
            return done(null, false, { message: "User not Found" });
        }
               
            if (await bcrypt.compare(password, user.hashedPassword)) {
                return done(null, user);
            } else {
                return done(null, false, { message: "Password Incorrect" });
            }
        } catch (error) {
            return done(error);
        }
    };

    passport.use(
        new LocalStrategy(
            { usernameField: "email", passwordField: "password" },
            authenticateUser
        )
    );

    
    passport.serializeUser((user, done) => {
        return done(null, user._id);
    });

    passport.deserializeUser(async (_id, done) => {
        
        try{
            const user = await users.findOne({_id:_id});
            return done(null, user);
        }catch(err){
            console.log(err);             
        }
    });
}

module.exports = initialize;
