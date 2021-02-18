const activity = require("../models/activity_model");
const mongoose = require("mongoose");
module.exports = async (req, res) => {
    id = req.query.id;
    const result = await activity.findOne({ parentId: id }, "commentsCount likesCount");
    res.status(200).json(result);
}