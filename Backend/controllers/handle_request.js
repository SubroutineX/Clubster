const requests = require("../models/requests_model");
const clubMembers = require("../models/club_members_model");
const mongoose = require("mongoose");
module.exports = async (req, res) => {
    try {
        id = req.query.requestId;
        parentId = req.body.clubId;
        user = req.body.user;
        status = req.body.status;

        const result = await requests.updateOne({ _id: id }, { status: status });
        if (result) {
            if (status == 'accepted') {
                TS = Date().toString();
                var clubMembersModel = new clubMembers({
                    _id: mongoose.Types.ObjectId(),
                    parentId: parentId,
                    user: user,
                    role: "member",
                    timeStamp: TS
                })
                clubMembersModel.save();
                res.status(200).json(`request ${status} successfully`);
            }
        }
    } catch (error) {
        console.log(error)
        res.status(500).json(error);
    }
}