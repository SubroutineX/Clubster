const postsModel = require("../models/posts_model");
const activity = require("../models/activity_model");
module.exports = async (req, res) => {
    try {
        user = req.user.userName;
        const result = await postsModel.find({ user: user });

        for (const data of result) {
            var value = await activity.findOne({ parentId: data._id }, "likesCount commentsCount");
            data['likes'] = value.likesCount;
            data['comments'] = value.commentsCount;
        };

        res.status(200).json(result);

    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }
}