const newsFeed = require("../models/news_feed_model");
const activity = require("../models/activity_model");
module.exports = async (req, res) => {
    try {
        const user = req.user.userName;
        var result = await newsFeed.find({ user: user }, { _id: 0, user: 0, __v: 0 });

        for (const data of result[0].posts) {
            var value = await activity.findOne({ parentId: data._id }, "likesCount commentsCount");
            console.log(value);
            data.likes = value.likesCount;
            data.comments = value.commentsCount;
        };
        console.log(result[0].posts);
        res.status(200).json(result[0].posts);
        return;

    } catch (error) {
        res.status(500).json(error);
    }

}
