const newsFeed = require("../models/news_feed_model");
module.exports = async (req, res) => {
    try {
        const user = req.user.userName;
        var result = await newsFeed.find({ user: user }, { _id: 0, user: 0, __v: 0 });
        res.status(200).json(result[0].posts);
        return;

    } catch (error) {
        res.status(500).json(error);
    }

}