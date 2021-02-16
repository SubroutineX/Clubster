const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var ActivitySchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    type: String,
    parentId: mongoose.Schema.Types.ObjectId,
    likesCount: Number,
    commentsCount: Number,
    timeStamp: String
});
module.exports = mongoose.model("activity", ActivitySchema);
