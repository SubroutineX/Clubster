const clubs = require("../models/clubs_model");
const follows = require("../models/follows_model");
const clubMembers = require("../models/club_members_model");

module.exports = async (req, res) => {
    try {
        let status = [false, false];
        var id = req.query.id;
        var name = req.query.name;
        var user = req.user.userName;
        var result1 = await clubMembers.findOne({ user: user, parentId: id }, "role");
        var result2 = await follows.findOne({ follower: user, followee: name }, "followee");


        if (result1 && result2) {
            status[0] = status[1] = true;
        } else if (result1) {
            status[0] = true;
        } else if (result2) {
            status[1] = true;
        }
        res.status(200).json(status);
    } catch (error) {
        res.status(500).json(error);
    }
};
