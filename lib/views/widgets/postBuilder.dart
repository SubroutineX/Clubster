import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:workflow/views/clubs/clubs_feed/imageDisplay.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/icons.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/widgets/inputField.dart';

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
                        style: textStyleSB(15, fontColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        college,
                        style: textStyleL(12, fontColor),
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
                        style: textStyleL(12, fontColor),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.more_vert,
                        color: fontColor,
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
            child: GestureDetector(
              onTap: () {
                Get.to(ImageView(
                  tag: postImgUrl,
                  likes: likes,
                  comments: comments,
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    postImgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
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
                      color: fontColor,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      comments.toString(),
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.send_rounded,
                  color: fontColorLight,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Icon(
                          Icons.bookmark_outline_rounded,
                          color: fontColor,
                        ),
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
          Divider(thickness: 1, color: fontColorLight.withOpacity(.05))
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
                        style: textStyleSB(15, fontColor),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        college,
                        style: textStyleL(12, fontColor),
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
                        style: textStyleL(12, fontColor),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.more_vert,
                        color: fontColor,
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
                hintStyle: textStyleR(
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
