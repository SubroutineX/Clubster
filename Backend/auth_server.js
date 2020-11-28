require("dotenv").config()
const express = require("express")
const app = express()
const jwt = require("jsonwebtoken")
const mongoose = require("mongoose")
const users = require("./models/users_model")
const bcrypt = require("bcrypt")

//database connection
var mongoDB =
	"mongodb+srv://admin:" +
	process.env.mongoDB +
	"@cluster0.hed3w.mongodb.net/WorkFlow?retryWrites=true&w=majority"
mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true })

app.use(express.json())

app.delete("/logout", (req, res) => {
	res.status(200).statusMessage("logged out")
})

app.post("/login", async (req, res) => {
	// Authenticate User
	try {
		const phone = req.body.phone
		const password = req.body.password
		const user = await users.findOne({ phone: phone })

		if (user == null) {
			return res.status(500).json("user not found")
		}
		if (await bcrypt.compare(password, user.hashedPassword)) {
			key = { username: user.userName }
			console.log(key)
			const accessToken = jwt.sign(key, process.env.ACCESS_TOKEN_SECRET)
			return res
				.status(200)
				.json({ accessToken: accessToken, user: user })
		} else {
			return res.status(500).json("password incorrect")
		}
	} catch (error) {
		return res.status(500).json(error)
	}
})
app.listen(process.env.AUTH_PORT)
