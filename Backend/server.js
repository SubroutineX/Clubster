if (process.env.NODE_ENV !== "production") {
	require("dotenv").config()
}
const express = require("express")
const app = express()
const PORT = process.env.PORT || 8000
const mongoose = require("mongoose")
const bodyParser = require("body-parser")
const jwt = require("jsonwebtoken")

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.set("views", "./views")
app.use(express.urlencoded({ extended: false }))
//database connection
var mongoDB =
	"mongodb+srv://admin:" +
	process.env.mongoDB +
	"@cluster0.hed3w.mongodb.net/WorkFlow?retryWrites=true&w=majority"
mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true })

//controllers:-
const registerUser = require("./controllers/register_user.js")

app.get("/", authenticateToken, (req, res) => {
	res.status(200).send("hello")
})

app.post("/register", registerUser)

function authenticateToken(req, res, next) {
	const authHeader = req.headers["authorization"]
	const token = authHeader && authHeader.split(" ")[1]
	if (token == null) return res.status(401).json("No token found")

	jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
		console.log(err)
		if (err) return res.sendStatus(403)
		req.user = user
		next()
	})
}

app.listen(PORT)
