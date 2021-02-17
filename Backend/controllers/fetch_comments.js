const mongoose = require("mongoose");
const comments = require("../models/comments_model");
module.exports = async (req, res) => {
    try {
        var id = req.query.id;
        const result = await comments.find({ parentId: id }, "user text TS");
        res.status(200).json(result);

    } catch (error) {
        console.log(error); 2
        res.status(500).json(error);
    }
}