const mv = require("mv");
const path = require("path");
const mongoose = require("mongoose");
const clubs = require("../models/clubs_model");
const formidable = require("formidable");
const clubMembers = require("../models/club_members_model");
const { nextTick } = require("process");
const { time } = require("console");
module.exports = (req, res) => {
    try {
        var college = req.user.college;
        var user = req.user.userName;
        var form = new formidable.IncomingForm();
        var TS = Date().toString();
        form.parse(req, function (err, fields, files) {
            if (err) {
                console.log(err);
            }
            fileName = fields.clubName + ".jpg";
            var oldpath = files.clubImage.path;
            var newpath = appRoot + "/uploads/clubsProfile/" + fileName;
            mv(oldpath, newpath, function (err) {
                if (err) throw err;

                var id = mongoose.Types.ObjectId();
                var clubsModel = new clubs({
                    _id: id,
                    clubName: fields.clubName,
                    genre: fields.genre,
                    description: fields.description,
                    status: fields.status,
                    memberLimit: fields.memberLimit,
                    elite: "No",
                    college: college,
                    timeStamp: TS

                });
                clubsModel.save();
                res.status(200).json("Club created successfully");
                var membersModel = new clubMembers({
                    _id: mongoose.Types.ObjectId(),
                    parentId: id,
                    user: user,
                    role: "admin",
                    timeStamp: TS

                });
                membersModel.save();

            });
        });
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }
};
