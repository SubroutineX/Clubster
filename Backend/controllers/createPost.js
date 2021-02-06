const mv = require("mv");
const path = require("path");
const mongoose = require("mongoose");
const formidable = require("formidable");
const posts = require("../models/posts_model");

module.exports = (req, res) => {
    try {
        var form = new formidable.IncomingForm();
        form.parse(req, function (err, fields, files) {
            if (err) {
                console.log(err);
            }
            timestamp = new Date().getTime().toString();
            var fileName = fields.caption + timestamp + ".jpg";
            var oldpath = files.postImage.path;
            var newpath = appRoot + "/uploads/posts/" + fileName;
            mv(oldpath, newpath, function (err) {
                if (err) throw err;
                var datetime = new Date();
                var curdate = datetime.toISOString().slice(0, 10);
                var postsModel = new posts({
                    _id: mongoose.Types.ObjectId(),
                    fileName: fileName,
                    caption: fields.caption,
                    createdAt: curdate,
                    user: req.user.userName,
                    college: req.user.college
                });
                postsModel.save();
                res.status(200).json("post created");
            });
        });

    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }
}