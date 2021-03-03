const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var RequestSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    user: String,
    parentId: mongoose.Schema.Types.ObjectId,
    status: String,
    type: String,
    timeStamp: String
});
module.exports = mongoose.model("Requests", RequestSchema);
