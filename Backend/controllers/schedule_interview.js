const mongoose = require("mongoose");
const interview = require("../models/interview_model");
module.exports = (req, res) => {
    try {
        id = req.query.id;
        user = req.body.user;
        description = req.body.description;
        date = req.body.date;
        time = req.body.time;
        TS = Date().toString();
        var interviewModel = new interview({
            _id: mongoose.Types.ObjectId(),
            parentId: id,
            user: user,
            description: description,
            date: date,
            time: time,
            timeStamp: TS
        });
        interviewModel.save();
        res.status(200).json("Interview Scheduled successfully");
    } catch (error) {
        res.status(500).json(error);
    }
}