const requests_model = require("../models/requests_model");
const mongoose = require("mongoose");
module.exports = async (req, res) => {
    try {
        user = req.user.userName;
        id = req.query.id;
        des = req.body.description;
        type = req.body.type;
        status = 'pending';
        TS = Date().toString();
        var RequestsModel = new requests_model({
            _id: mongoose.Types.ObjectId(),
            user: user,
            parentId: id,
            type: type,
            description: des,
            status: status,
            timeStamp: TS
        });
        RequestsModel.save();
        res.status(200).json("Request Sent Successfully");
    } catch (error) {
        res.status(500).json(error);
    }

}