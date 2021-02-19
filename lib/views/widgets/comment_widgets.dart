import 'package:flutter/material.dart';
import 'package:workflow/models/comments_model.dart';
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
        vertical: 8,
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
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: postProfileName != null
                              ? "@" + postProfileName + "  "
                              : "",
                          style: textStyleSofiaB(
                            15,
                            colorFont(),
                          ),
                        ),
                        TextSpan(
                          text: caption != null
                              ? caption.length >= 51
                                  ? caption.toString().substring(0, 50) + " ..."
                                  : caption
                              : "",
                          style: textStyleGilroySB(
                            15,
                            colorFont(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Text(
                  //   caption.length >= 51
                  //       ? caption.toString().substring(0, 50) + " ..."
                  //       : caption,
                  //   style: textStyleGilroyM(
                  //     14,
                  //     colorFontLight(),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommentBuilder extends StatelessWidget {
  CommentBuilder({Key key, this.commentInfo}) : super(key: key);

  final Comment commentInfo;

  String getLikes(int likes) {
    double convertedLikesDouble;
    int convertedLikesInt;
    String likeString;
    if (likes <= 999) {
      convertedLikesInt = likes;
      likeString = convertedLikesInt.toString();
    } else if (1000 <= likes && likes <= 999999) {
      convertedLikesDouble = likes / 1000;
      likeString = convertedLikesDouble.toString() + "k";
    } else {
      convertedLikesDouble = likes / 1000000;
      likeString = convertedLikesDouble.toString() + "M";
    }
    return likeString;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                "assets/images/dancers.jpg",
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
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              commentInfo.user,
                              style: textStyleGilroySB(
                                15,
                                colorFont(),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "2hrs ago",
                              style: textStyleSofiaR(
                                12,
                                colorFontLight(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () => print("liked"),
                        child: Container(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    commentInfo.text,
                    style: textStyleGilroyM(
                      15,
                      colorFont(),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Divider(
                    height: 3,
                    color: commentDividerColor(),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          getLikes(12000) + " Likes",
                          style: textStyleGilroyM(
                            12,
                            colorFontLight(),
                          ),
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
