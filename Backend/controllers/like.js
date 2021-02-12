const likes = require("../models/likes_model");
const mongoose = require("mongoose");
module.exports = (req, res) => {
    const id = req.query.id;
    const type = req.query.type;
    const TS = Date().toString();
    var likesModel = new likes({
        _id: mongoose.Types.ObjectId(),
        type: type,
        active: true,
        parentId: id,
        user: req.user.userName,
        timeStamp: TS
    });
    likesModel.save();
    res.status(200).json("post Liked");
}