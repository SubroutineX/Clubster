const comments = require("../models/comments_model");
const mongoose = require("mongoose");
module.exports = (req, res) => {
    try {
        var comment = req.body.comment;
        var user = req.user.userName;
        var id = req.query.id;
        var TS = Date().toString();
        var commentsModel = new comments({
            _id: mongoose.Types.ObjectId(),
            text: comment,
            parentId: id,
            user: user,
            timeStamp: TS
        });
        commentsModel.save();
        res.status(200).json("comment added");
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }
}