const newsFeed = require("../models/news_feed_model");
const activity = require("../models/activity_model");
module.exports = async (req, res) => {
    try {
        const user = req.user.userName;
        var result = await newsFeed.find({ user: user }, { _id: 0, user: 0, __v: 0 });
     
	    result[0].posts.forEach(async (value) => {
            count = await activity.findOne({ parentId: value._id }, "likesCount commentsCount");
            console.log("inside");
            console.log(count.likesCount);
		    value.likes = count.likesCount;
            value.comments = count.commentsCount;
             console.log(value.likes);
        });
	    console.log("outside");
        res.status(200).json(result[0].posts);
        return;

    } catch (error) {
        res.status(500).json(error);
    }

}
