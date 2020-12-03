const mongoose = require("mongoose");
const clubs = require("../models/clubs_model");

module.exports = (req, res) => {
    try {
        var clubsModel = new clubs({
            _id: mongoose.Types.ObjectId(),
            clubName: req.body.clubName,
            genre: req.body.genre,
            description: req.body.description,
            status: req.body.status,
            memberLimit: req.body.memberLimit,
            members: req.body.members
        });
        // clubsModel.members.push(req.body.members);
        clubsModel.save();
        res.status(200).json("club created");

    } catch (error) {
        console.log(error);
        res.status(500).json({ error: error });

    }
}

