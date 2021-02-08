const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var CommentsSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    text: String,
    user: String,
    parentId: String,
    timeStamp: String
});
module.exports = mongoose.model("comments", CommentsSchema);
