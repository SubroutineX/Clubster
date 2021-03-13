const clubMembersModel = require("../models/club_members_model");
module.exports = async (req, res) => {
    try {
        clubId = req.query.clubId;
        const result = await clubMembersModel.find({ parentId: clubId }, "role user");
        res.status(200).json(result);
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }
}