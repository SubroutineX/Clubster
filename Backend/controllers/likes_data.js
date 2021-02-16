const mongoose = require("mongoose");
const likes = require("../models/likes_model");
module.exports = async (req, res) => {
    const id = req.query.id;
    var result = await likes.find({ parentId: id, active: true }, "type user timeStamp");
    res.status(200).json(result);
}