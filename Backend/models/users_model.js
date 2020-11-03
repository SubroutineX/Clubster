const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var UsersSchema = new Schema({
    _id:mongoose.Schema.Types.ObjectId,
    name:String,//
    userName:String,//
    user:String,//
    phone:Number,//
    hashedPassword:String,
    college:String,
    dept:String,
});

module.exports = mongoose.model("users",UsersSchema);