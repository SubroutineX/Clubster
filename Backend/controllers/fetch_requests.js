const requests = require("../models/requests_model")
module.exports = async (req, res) => {
	try {
		var id = req.query.id
		var type = req.query.type
		var status = req.query.status
		var result = await requests.find(
			{ parentId: id, type: type, status: status },
			"user description timeStamp"
		)
		if (result) {
			res.status(200).json(result)
		} else {
			res.status(500).json("Error")
		}
	} catch (error) {
		res.status(500).json(error)
	}
}
