const path = require("path");
module.exports = (req, res) => {
    imageName = req.query.imageName;
    var filePath = __dirname + "\\..\\uploads\\" + imageName;
    console.log(filePath)
    res.sendFile(path.resolve(filePath));
}