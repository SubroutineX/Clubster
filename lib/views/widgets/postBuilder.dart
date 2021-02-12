import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/icons.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key key,
    this.name,
    this.college,
    this.likes,
    this.comments,
    this.bookmark,
    this.postDay,
    this.profileImgUrl,
    this.postImgUrl,
  }) : super(key: key);

  final String profileImgUrl;
  final String postImgUrl;

  final String name;
  final String college;
  final int likes;
  final int comments;
  final bool bookmark;
  final String postDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 40,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: AssetImage(profileImgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: textStyleGilroySB(
                          15,
                          colorFont(),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        college,
                        style: textStyleGilroyR(
                          11,
                          colorFontLight(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        postDay,
                        style: textStyleGilroyR(
                          12,
                          colorFontLight(),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.more_horiz_rounded,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: AspectRatio(
              aspectRatio: 1.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: Image.asset(
                  postImgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  color: red,
                  size: 22,
                  semanticLabel: "Like",
                ),
                SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(
                  commentIcon,
                  color: blue,
                  height: 22,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.share_rounded,
                  size: 18,
                  color: colorFont(),
                ),
                Spacer(),
                Icon(
                  Icons.bookmark_border_outlined,
                  size: 22,
                  color: colorFont(),
                )
              ],
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              child: Text(
                "This is my dance club !!!!",
                style: textStyleGilroySB(
                  15,
                  colorFont(),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 3,
            color: dividerColor(),
          ),
        ],
      ),
    );
  }
}

class ImageUploadBuilder extends StatelessWidget {
  const ImageUploadBuilder({
    Key key,
    this.name,
    this.college,
    this.bookmark,
    this.postDay,
    this.profileImgUrl,
    this.postImg,
    this.fieldController,
  }) : super(key: key);

  final String profileImgUrl;
  final File postImg;
  final String name;
  final String college;
  final bool bookmark;
  final String postDay;

  final TextEditingController fieldController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    profileImgUrl,
                  ),
                  backgroundColor: transparent,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: textStyleGilroySB(15, colorFont()),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        college,
                        style: textStyleGilroyL(12, colorFont()),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        postDay,
                        style: textStyleGilroyL(12, colorFont()),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.more_vert,
                        color: colorFont(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  postImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              style: formFieldStyle,
              maxLines: null,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Add caption...",
                hintStyle: textStyleGilroyR(
                  16,
                  fontColorLight,
                ),
              ),
              controller: fieldController,
            ),
          ),
          Divider(
            thickness: 1,
            color: fontColorLight.withOpacity(.05),
          )
        ],
      ),
    );
  }
}
