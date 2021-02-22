const follows = require("../models/follows_model");
const mongoose = require("mongoose");
module.exports = async (req, res) => {
    try {
        const follower = req.user.userName;
        const followee = req.body.name;
        const type = req.query.type;
        var TS = Date().toString();
        var followsModel = new follows({
            _id: mongoose.Types.ObjectId(),
            follower: follower,
            followee: followee,
            type: type,
            timeStamp: TS
        });
        followsModel.save();
        res.status(200).json(`You started Following ${followee}`);
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }

}