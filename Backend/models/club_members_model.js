const mongoose = require("mongoose");

var Schema = mongoose.Schema;

var ClubMembersSchema = new Schema({
    _id: mongoose.Schema.Types.ObjectId,
    parentId: mongoose.Schema.Types.ObjectId,
    user: String,
    role: String,
    timeStamp: String

});

module.exports = mongoose.model("clubMembers", ClubMembersSchema);