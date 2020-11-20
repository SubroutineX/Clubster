const LocalStrategy = require("passport-local").Strategy;
const bcrypt = require("bcrypt");
const users = require("../models/users_model");

function initialize(passport) {
    
    const authenticateUser = async (phone, password, done) => { 
        try {
        const user = await users.findOne({phone:phone});
        
        
        if (user == null) {
            return done(null, false,  "User not Found" );
        }
               
            if (await bcrypt.compare(password, user.hashedPassword)) {
                return done(null, user);
            } else {
                return done(null, false,  "Password Incorrect" );
            }
        } catch (error) {
            return done(error);
        }
    };

    passport.use(
        new LocalStrategy(
            { usernameField: "phone", passwordField: "password" },
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
