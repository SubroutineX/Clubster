const likes = require("../models/likes_model");
const mongoose = require("mongoose");
const activity = require("../models/activity_model");
module.exports = async (req, res) => {
    const id = req.query.id;
    likes.deleteOne({ parentId: id }, function (err, result) {
        if (err) {
            console.log(err);
        }
    });
    res.status(200).json("unliked");
    activity.updateOne({ parentId: id }, { $inc: { likesCount: -1 } }, function (err, result) {
        if (err) {
            console.log(err);
        }
    });

}