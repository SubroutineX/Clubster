const bcrypt = require("bcrypt");
const mongoose = require("mongoose");
const users = require("../models/users_model");


module.exports = async (req, res) => {
    try {

        const hashedPassword = await bcrypt.hash(req.body.password, 10);

        var usersModel = new users({
            _id: mongoose.Types.ObjectId(),
            name: req.body.name,
            userName: req.body.username,
            user: req.body.user,
            phone: req.body.phone,
            hashedPassword: hashedPassword,
            college: req.body.college,
            dept: req.body.dept
        });
        usersModel.save();
        res.status(200).json({ success: 'True' });

    } catch (err) {
        console.log(err);
        res.status(500).json({ error: err });
    }
}