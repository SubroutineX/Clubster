const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var CommentsSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    type: String,
    parentId: String,
    likesCount: Number,
    commentsCount: Number,
    timeStamp: String
});
module.exports = mongoose.model("comments", CommentsSchema);
