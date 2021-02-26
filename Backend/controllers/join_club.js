const { Mongoose } = require("mongoose");
const clubMembers = require("../models/club_members_model");
const mongoose = require("mongoose");
module.exports = async (req, res) => {
    try {
        var clubId = req.query.clubId;
        var user = req.user.userName;
        var TS = Date().toString();
        var membersModel = new clubMembers({
            _id: mongoose.Types.ObjectId(),
            parentId: clubId,
            user: user,
            role: 'member',
            timeStamp: TS
        });
        membersModel.save();
        res.status(200).json("joined Successfully");
    }
    catch (error) {
        res.status(500).json(error);
    }

}