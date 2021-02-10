const bcrypt = require("bcrypt");
const mongoose = require("mongoose");
const users = require("../models/users_model");
const follows = require("../models/follows_model");
const newsFeed = require("../models/news_feed_model");



module.exports = async (req, res) => {
    try {

        const hashedPassword = await bcrypt.hash(req.body.password, 10);

        var usersModel = new users({
            _id: mongoose.Types.ObjectId(),
            name: req.body.name,
            userName: req.body.userName,
            user: req.body.user,
            phone: req.body.phone,
            hashedPassword: hashedPassword,
            college: req.body.college,
            dept: req.body.dept
        });
        console.log(usersModel);
        usersModel.save();
        res.status(200).json({ success: 'True' });
        var newsFeedModel = new newsFeed({ _id: mongoose.Types.ObjectId(), user: req.body.userName });
        newsFeedModel.save();
        var followsModel = new follows({ _id: mongoose.Types.ObjectId(), follower: req.body.userName, followee: req.body.userName, type: "endUser" });
        followsModel.save();

    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
}