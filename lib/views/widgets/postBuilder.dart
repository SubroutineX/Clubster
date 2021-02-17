import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/fetch_news_feed_controller.dart';
import 'package:workflow/controllers/like_controller.dart';
import 'package:workflow/models/news_feed.dart';
import 'package:workflow/views/clubs/clubs_feed/imageDisplay.dart';
import 'package:workflow/views/clubs/clubs_upload/comment_page.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/icons.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';
import 'package:share/share.dart';

class PostCard extends StatelessWidget {
  PostCard({
    Key key,
    @required this.postInfo,
  }) : super(key: key);

  final NewsFeed postInfo;
  final likeController = Get.put(LikeController());

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
                    child: Container(
                      color: white,
                      child: Image(
                        image: AssetImage("assets/images/cricket.jpg"),
                        fit: BoxFit.cover,
                      ),
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
                        postInfo.user,
                        style: textStyleGilroySB(
                          15,
                          colorFont(),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        postInfo.college,
                        style: textStyleGilroyM(
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
                        "today",
                        style: textStyleGilroyM(
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
              child: GestureDetector(
                onTap: () {
                  Get.to(ImageView(
                    postInfo: postInfo,
                  ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  child: Container(
                    color: bw(),
                    child: Image.network(
                      "http://65.1.43.39:8000/fetchNewsImage?imageName=" +
                          postInfo.fileName,
                      fit: BoxFit.cover,
                    ),
                  ),
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
                GetX<FetchNewsFeedController>(builder: (controller) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      if (postInfo.like.value) {
                        likeController.unlike(postInfo.id);
                        postInfo.like.value = !postInfo.like.value;
                        postInfo.likes -= 1;
                      } else {
                        likeController.like(postInfo.id);
                        postInfo.like.value = !postInfo.like.value;
                        postInfo.likes += 1;
                      }
                      //  if (postInfo.like.value) {
                      //     postInfo.like.value = !postInfo.like.value;
                      //     postInfo.likes -= 1;
                      //   } else {
                      //     postInfo.like.value = !postInfo.like.value;
                      //     postInfo.likes += 1;
                      //   }
                    },
                    child: Container(
                      height: 25,
                      width: 56,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        color: postInfo.like.value ? red : transparent,
                        border: postInfo.like.value
                            ? Border.all(
                                width: 0,
                                color: red,
                              )
                            : Border.all(
                                width: 1.5,
                                color: red,
                              ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: postInfo.like.value ? white : red,
                            size: 16,
                            semanticLabel: "Like",
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Expanded(
                            child: Container(
                              child: Center(
                                child: Text(
                                  postInfo.likes.toString(),
                                  style: textStyleSofiaSB(
                                    13,
                                    postInfo.like.value ? white : colorFont(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => Get.to(
                    CommentPage(
                      postInfo: postInfo,
                    ),
                  ),
                  child: Container(
                    height: 25,
                    width: 56,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      color: transparent,
                      border: Border.all(
                        width: 1.5,
                        color: blue,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          commentIcon,
                          color: blue,
                          height: 18,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Expanded(
                          child: Container(
                            child: Center(
                              child: Text(
                                postInfo.comments.toString(),
                                style: textStyleSofiaSB(
                                  13,
                                  colorFont(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => share(context, "hellllllo"),
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.share_rounded,
                        size: 18,
                        color: colorFont(),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GetX<FetchNewsFeedController>(builder: (controller) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      postInfo.bookmark.value = !postInfo.bookmark.value;
                    },
                    child: Icon(
                      postInfo.bookmark.value
                          ? Icons.bookmark_rounded
                          : Icons.bookmark_border_outlined,
                      size: 22,
                      color: postInfo.bookmark.value ? mango : colorFont(),
                    ),
                  );
                })
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
                postInfo.caption != null ? postInfo.caption : "",
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

void share(BuildContext context, String text) {
  final String text1 = text;
  final RenderBox box = context.findRenderObject();
  Share.share(
    text1,
    subject: text1,
    sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
  );
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
