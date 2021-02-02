const mv = require("mv");
const path = require("path");
const mongoose = require("mongoose");
const clubs = require("../models/clubs_model");
const formidable = require("formidable");
const { nextTick } = require("process");
module.exports = (req, res) => {
    try {
        var college = req.user.college;
        var form = new formidable.IncomingForm();
        form.parse(req, function (err, fields, files) {
            if (err) {
                console.log(err);
            }
            fileName = fields.clubName + ".jpg";
            var oldpath = files.clubImage.path;
            var newpath = appRoot + "/uploads/clubsProfile/" + fileName;
            mv(oldpath, newpath, function (err) {
                if (err) throw err;
                var clubsModel = new clubs({
                    _id: mongoose.Types.ObjectId(),
                    clubName: fields.clubName,
                    genre: fields.genre,
                    description: fields.description,
                    status: fields.status,
                    memberLimit: fields.memberLimit,
                    elite: "No",
                    college: college,
                    members: [],
                });
                clubsModel.save();
                res.status(200).json("Club created successfully");
            });
        });
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }
};
