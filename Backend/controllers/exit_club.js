const clubMembers = require("../models/club_members_model");
module.exports = async (req, res) => {
    try {
        var id = req.query.id;
        var user = req.user.userName;
        var result = await clubMembers.deleteOne({ parentId: id, user: user });
        if (result) {
            res.status(200).json("Exited SuccessFully");
        }
    } catch (error) {
        res.status(500).json(error);
    }
}