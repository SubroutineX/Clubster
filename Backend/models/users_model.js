const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var UsersSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    name: String,//
    userName: String,//
    user: String,//
    phone: String,//
    hashedPassword: String,
    college: String,//
    dept: String,
    profileImage: String,
    aboutMe: String,
    notifications: Array,
    createdAt: String
});

module.exports = mongoose.model("users", UsersSchema);