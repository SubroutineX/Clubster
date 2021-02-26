if (process.env.NODE_ENV !== "production") {
    require("dotenv").config();
}
require("dotenv").config();
const jwt = require("jsonwebtoken");
const users = require("./models/users_model");
const bcrypt = require("bcrypt");
const express = require("express");
const app = express();
const PORT = process.env.PORT || 8000;
const mongoose = require("mongoose");
const bodyParser = require("body-parser");
const path = require("path");
global.appRoot = path.resolve(__dirname);
const cors = require("cors");

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: false }));
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

//database connection
var mongoDB =
    "mongodb+srv://admin:" +
    process.env.mongoDB +
    "@cluster0.hed3w.mongodb.net/WorkFlow?retryWrites=true&w=majority";
mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true });

//helpers
const authenticateToken = require("./helpers/authenticate_token");

//controllers:-
const registerUser = require("./controllers/register_user.js");
const registerClub = require("./controllers/register_club");
const fetchClubs = require("./controllers/fetch_clubs");
const fetchClubImage = require("./controllers/fetch_club_image");
const createPost = require("./controllers/create_post");
const fetchNewsFeed = require("./controllers/fetch_news_feed");
const fetchFeedImage = require("./controllers/fetch_feed_image");
const like = require("./controllers/like");
const likesData = require("./controllers/likes_data");
const unlike = require("./controllers/unlike");
const comment = require("./controllers/comment");
const fetchComments = require("./controllers/fetch_comments");
const commentsCount = require("./controllers/comments_count");
const follow = require("./controllers/follow");
const FetchfollowingStat = require("./controllers/fetch_following_stat");
const unfollow = require("./controllers/unfollow");
const joinClub = require("./controllers/join_club");

//Routes

app.all('/', function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "X-Requested-With");
    next()
});

app.delete("/logout", (req, res) => {
    res.status(200).json("logged out");
});

app.post("/login", async (req, res) => {
    // Authenticate User
    try {
        const phone = req.body.phone;
        const password = req.body.password;
        const user = await users.findOne({ phone: phone });

        if (user == null) {
            return res.status(500).json("user not found");
        }
        if (await bcrypt.compare(password, user.hashedPassword)) {
            key = {
                userName: user.userName,
                college: user.college,
                dept: user.dept,
            };
            console.log(key);
            const accessToken = jwt.sign(key, process.env.ACCESS_TOKEN_SECRET);
            return res
                .status(200)
                .json({ accessToken: accessToken, user: user });
        } else {
            return res.status(500).json("password incorrect");
        }
    } catch (error) {
        return res.status(500).json(error);
    }
});


app.get("/", (req, res) => {
    // res.render("index.ejs");
    res.status(200).send("hello");
});
app.post("/register", registerUser);
app.post("/registerClub", authenticateToken, registerClub);
app.get("/fetchClubs", authenticateToken, fetchClubs);
app.get("/fetchClubImage", fetchClubImage);
app.post("/createPost", authenticateToken, createPost);
app.get("/fetchNewsFeed", authenticateToken, fetchNewsFeed);
app.get("/fetchNewsImage", fetchFeedImage);
app.post("/like", authenticateToken, like);
app.post("/likesData", authenticateToken, likesData);
app.post("/unlike", authenticateToken, unlike);
app.post("/comment", authenticateToken, comment);
app.get("/fetchComments", authenticateToken, fetchComments);
app.get("/commentsCount", authenticateToken, commentsCount);
app.post("/follow", authenticateToken, follow);
app.post("/unfollow", authenticateToken, unfollow);
app.get("/fetchFollowingStat", authenticateToken, FetchfollowingStat);
app.get("/joinClub", authenticateToken, joinClub);

app.listen(PORT);
