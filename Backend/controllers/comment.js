const comments = require("../models/comments_model");
const mongoose = require("mongoose");
const activity = require("../models/activity_model");

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

        activity.updateOne({ parentId: id }, { $inc: { commentsCount: 1 } }, function (err, result) {
            if (err) {
                console.log(err);
            }
        });

    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }
}