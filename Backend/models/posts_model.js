const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var PostsSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    fileName: String,
    caption: String,
    user: String,
    college: String,
    timeStamp: String,
    likes: Number,
    comments: Number
});
module.exports = mongoose.model("posts", PostsSchema);
