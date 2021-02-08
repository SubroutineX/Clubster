const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var LikesSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    type: String,
    active: Boolean,
    parentId: mongoose.Schema.Types.ObjectId,
    user: String,
    timeStamp: String
});

module.exports = mongoose.model("likes", LikesSchema);
