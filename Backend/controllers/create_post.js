const mv = require("mv");
const path = require("path");
const mongoose = require("mongoose");
const formidable = require("formidable");
const posts = require("../models/posts_model");
const follows = require("../models/follows_model");
const newsFeed = require("../models/news_feed_model");


module.exports = async (req, res) => {
    try {
        var form = new formidable.IncomingForm();
        form.parse(req, async function (err, fields, files) {
            if (err) {
                console.log(err);
            }
            timestamp = new Date().getTime().toString();
            var TS = Date().toString();
            var fileName = fields.caption + timestamp + ".jpg";
            var oldpath = files.postImage.path;
            var newpath = appRoot + "/uploads/posts/" + fileName;
            mv(oldpath, newpath, async function (err) {
                if (err) throw err;
                var id = mongoose.Types.ObjectId();
                var postsModel = new posts({
                    _id: id,
                    fileName: fileName,
                    caption: fields.caption,
                    user: req.user.userName,
                    college: req.user.college,
                    timeStamp: TS
                });
                postsModel.save();
                res.status(200).json("post created");
                var followers = [];
                followers = await follows.find({ followee: req.user.userName }, "follower");

                followers.forEach((value) => {

                    newsFeed.updateOne({ user: value.follower }, {
                        $push: {
                            posts: {
                                _id: id,
                                fileName: fileName,
                                caption: fields.caption,
                                user: req.user.userName,
                                college: req.user.college,
                                timeStamp: TS
                            }
                        }
                    }, function (err, result) {
                        if (err) {
                            console.log(err);
                        }
                    });
                });

            });

        });



    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }
}
