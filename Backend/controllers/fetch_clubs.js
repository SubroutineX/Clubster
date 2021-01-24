const clubs = require("../models/clubs_model");

module.exports = async (req, res) => {
    try {
        fetchedClubs = await clubs.find({}, "clubName status elite genre description status memberLimit");
        console.log(fetchedClubs);
        res.status(200).json(fetchedClubs);
    } catch { }
};
