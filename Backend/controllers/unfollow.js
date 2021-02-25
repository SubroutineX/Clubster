const mongoose = require("mongoose");
const follows = require("../models/follows_model");
module.exports = async (req, res) => {
    try {
        var name = req.body.name;
        var type = req.body.type;
        var user = req.user.userName;
        var result = await follows.deleteOne({ follower: user, followee: name, type: type });
        if (result) {
            res.status(200).json(`You unfollowed ${name}`);
        } else {
            res.status(500).json("error");
        }
    }
    catch (error) {
        res.status(500).json(error);
    }


}