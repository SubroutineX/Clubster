import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/icons.dart';

class ImageView extends StatelessWidget {
  final String tag;
  final int likes;
  final int comments;

  const ImageView({Key key, this.tag, this.likes, this.comments})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(
                  Icons.favorite,
                  color: sizzlingRed,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  likes.toString(),
                  style: TextStyle(color: white),
                ),
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  commentIcon,
                  color: white,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  comments.toString(),
                  style: TextStyle(color: white),
                ),
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Icon(
              Icons.send_rounded,
              color: white,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Icon(
                      Icons.bookmark_outline_rounded,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.chevron_left,
            color: white,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: black.withOpacity(1),
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Hero(
              tag: tag,
              child: Image.asset(
                tag,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
