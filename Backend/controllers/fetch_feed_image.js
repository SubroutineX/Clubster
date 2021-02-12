const path = require("path");
module.exports = (req, res) => {
    const imageName = req.query.imageName;
    res.sendFile(path.join(appRoot + "/uploads/posts/" + imageName));
}