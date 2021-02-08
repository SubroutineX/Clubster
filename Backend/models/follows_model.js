const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var FollowsSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    follower: String,
    followee: String,
    type: String

});

module.exports = mongoose.model("follows", FollowsSchema);
