import 'package:flutter/material.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class PostInfo extends StatelessWidget {
  const PostInfo({
    Key key,
    this.postImageUrl,
    this.postProfileName,
    this.caption,
  }) : super(key: key);

  final String postImageUrl;
  final String postProfileName;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  postImageUrl,
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
                    postProfileName,
                    style: textStyleGilroySB(
                      16,
                      colorFont(),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    caption.length >= 51
                        ? caption.toString().substring(0, 50) + " ..."
                        : caption,
                    style: textStyleGilroyM(
                      14,
                      colorFontLight(),
                    ),
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
                      15,
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
