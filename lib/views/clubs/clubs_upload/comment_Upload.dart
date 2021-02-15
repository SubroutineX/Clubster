import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class Cmt extends StatelessWidget {
  String sarangImage =
      "data:image/jpeg;base64,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";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            backgroundColor: bw(),
            expandedHeight: 160,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Comments",
                                style: textStyleGilroySB(
                                  20,
                                  colorFont(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Postcomment(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Comment(
                  name: "Abhijeet Takale",
                  time: "20sec ago",
                  comment: "Euuuuuu",
                  likes: 28,
                  profileImgUrl:
                      "https://images.unsplash.com/photo-1577933679437-f3171f9b963a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80",
                ),
                Comment(
                  name: "Shivam Gawade",
                  time: "1hr ago",
                  comment: "@Abhijeet Parnika mazhi ahe",
                  likes: 2500,
                  profileImgUrl:
                      "https://www.famousbirthdays.com/headshots/just-sul-1.jpg",
                ),
                Comment(
                  name: "Sarang kawade",
                  time: "3hr ago",
                  comment: "Next time mala pan bolva ",
                  likes: 31,
                  profileImgUrl: sarangImage,
                ),
                Comment(
                  name: "Atharva Palande",
                  time: "8hr ago",
                  comment: "No load ",
                  likes: 101,
                  profileImgUrl:
                      "https://www.askideas.com/media/37/Funny-Eagle-Haircuts-For-Men.jpg",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Postcomment extends StatelessWidget {
  const Postcomment({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15,
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1561070791-2526d30994b5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Nikhil Shinde",
                    style: textStyleGilroySB(
                      16,
                      colorFont(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Check out my new dribble shot!",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  Comment({
    Key key,
    this.name,
    this.time,
    this.comment,
    this.likes,
    this.profileImgUrl,
  }) : super(key: key);

  final String name;
  final String time;
  final String comment;
  final int likes;
  final String profileImgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: NetworkImage(
                  profileImgUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: textStyleGilroySB(
                      16,
                      colorFont(),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    time,
                    style: textStyleGilroyR(
                      12,
                      colorFontLight(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    comment,
                    style: textStyleGilroyM(
                      14,
                      colorFontLight(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 3,
                    color: commentDividerColor(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 15,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        likes.toString() + " Likes",
                        style: textStyleGilroyM(
                          12,
                          colorFont(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
