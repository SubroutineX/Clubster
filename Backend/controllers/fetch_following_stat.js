const clubs = require("../models/clubs_model");
const follows = require("../models/follows_model");

module.exports = async (req, res) => {
    try {
        var name = req.query.name;
        var user = req.user.userName;
        var result = await follows.findOne({ follower: user, followee: name }, "followee");

        if (result) {
            res.status(200).json(true);
        } else {
            res.status(200).json(false);
        }

    } catch (error) {
        res.status(500).json(error);
    }
};
