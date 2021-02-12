const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var NewsFeedSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    user: String,
    posts: Array,
    timeStamp: String
});

module.exports = mongoose.model("newsFeed", NewsFeedSchema);
