const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var ClubsSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    clubName: String, //
    genre: String, //
    description: String, //
    status: String, //
    memberLimit: Number,
    elite: String,
    college: String,
    timeStamp: String
});

module.exports = mongoose.model("clubs", ClubsSchema);
