var multer = require("multer");
var path = require("path");
const mongoose = require("mongoose");
const clubs = require("../models/clubs_model");

module.exports = (req, res) => {
    try {
        console.log(
            req.body.clubName,
            req.body.genre,
            req.body.description,
            req.body.status,
            req.body.memberLimit
        );
        fileName = req.body.clubName + ".jpg";
        var storage = multer.diskStorage({
            destination: function (req, file, cb) {
                // Uploads is the Upload_folder_name
                cb(null, "uploads");
            },
            filename: function (req, file, cb) {
                cb(null, fileName);
            },
        });
        const maxSize = 1 * 1000 * 1000;

        var upload = multer({
            storage: storage,
            limits: { fileSize: maxSize },
            fileFilter: function (req, file, cb) {
                // Set the filetypes, it is optional
                var filetypes = /jpeg|jpg|png/;
                var mimetype = filetypes.test(file.mimetype);

                var extname = filetypes.test(
                    path.extname(file.originalname).toLowerCase()
                );

                if (mimetype && extname) {
                    return cb(null, true);
                }

                cb(
                    "Error: File upload only supports the " +
                        "following filetypes - " +
                        filetypes
                );
            },
            // mypic is the name of file attribute
        }).single("clubImage");
        // Error MiddleWare for multer file upload, so if any
        // error occurs, the image would not be uploaded!
        upload(req, res, function (error) {
            if (error) {
                // ERROR occured (here it can be occured due
                // to uploading image of size greater than
                // 1MB or uploading different file type)
                res.status(500).json(error);
            } else {
                var clubsModel = new clubs({
                    _id: mongoose.Types.ObjectId(),
                    clubName: req.body.clubName,
                    genre: req.body.genre,
                    description: req.body.description,
                    status: req.body.status,
                    memberLimit: req.body.memberLimit,
                    members: ["a", "b", "c"],
                });
                // clubsModel.members.push(req.body.members);
                clubsModel.save();
                res.status(200).json("Club created successfully");

                // SUCCESS, image successfully uploaded
                // res.status(200).json("Success, Image uploaded!")
            }
        });
    } catch (error) {
        console.log(error);
        res.status(500).json(error.message);
    }
};
