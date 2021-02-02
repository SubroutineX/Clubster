const path = require("path");
module.exports = (req, res) => {
    imageName = req.query.imageName;
    res.sendFile(path.join(appRoot + "/uploads/clubsProfile/" + imageName));
}