const usersModel = require("../models/users_model");
const clubsModel = require("../models/clubs_model");
const clubMembersModel = require("../models/club_members_model");
const { resolve } = require("path");
module.exports = async (req, res) => {
    try {
        var createdClubs = [];
        var joinedClubs = [];
        user = req.user.userName;
        var result = await usersModel.findOne({ userName: user }, { hashedPassword: 0 });
        var result1 = await clubMembersModel.find({ user: user }, { _id: 0, user: 0, timeStamp: 0, __v: 0 });

        for (const data of result1) {
            if (data.role == 'admin') {
                createdClubs.push(data.parentId);
            } else {
                joinedClubs.push(data.parentId);
            }
        }

        var result2 = await clubsModel.find({ _id: { $in: createdClubs } });
        var result3 = await clubsModel.find({ _id: { $in: joinedClubs } });

        data = {
            userData: result,
            createdClubs: result2,
            joinedClubs: result3
        }
        res.status(200).json(data);

    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }
}