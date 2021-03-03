const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var ActivitySchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    parentId: mongoose.Schema.Types.ObjectId,
    user: String,
    description: String,
    date: String,
    time: String,
    timeStamp: String
});
module.exports = mongoose.model("activity", ActivitySchema);
