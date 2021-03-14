const mongoose = require("mongoose");
const interview = require("../models/interview_model");
const requestsModel = require("../models/requests_model");
module.exports = async (req, res) => {
    try {
        clubId = req.query.clubId;
        requestId = req.query.requestId;
        user = req.body.user;
        description = req.body.description;
        date = req.body.date;
        time = req.body.time;
        TS = Date().toString();
        var interviewModel = new interview({
            _id: mongoose.Types.ObjectId(),
            parentId: clubId,
            user: user,
            description: description,
            date: date,
            time: time,
            timeStamp: TS
        });
        interviewModel.save();
        var status = 'interviewScheduled';
        var result = await requestsModel.updateOne({ _id: requestId }, { status: status });
        if (result)
            res.status(200).json("Interview Scheduled successfully");
    } catch (error) {
        console.log(error);
        res.status(500).json(error);
    }
}