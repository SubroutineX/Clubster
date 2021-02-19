import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/fetch_news_feed_controller.dart';
import 'package:workflow/models/news_feed.dart';
import 'package:workflow/views/clubs/clubs_upload/comment_page.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/icons.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class ImageView extends StatelessWidget {
  final NewsFeed postInfo;

  const ImageView({
    Key key,
    @required this.postInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      bottomNavigationBar: imageViewBottomNavbar(),
      appBar: imageViewAppbar(),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: AspectRatio(
                aspectRatio: 1,
                child: InteractiveViewer(
                  maxScale: 3,
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
      ),
    );
  }

  Padding imageViewBottomNavbar() {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GetX<FetchNewsFeedController>(
            builder: (controller) {
              return InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  if (postInfo.like.value) {
                    postInfo.like.value = !postInfo.like.value;
                    postInfo.likes -= 1;
                  } else {
                    postInfo.like.value = !postInfo.like.value;
                    postInfo.likes += 1;
                  }
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
                              postInfo.likes != null
                                  ? postInfo.likes.toString()
                                  : "0",
                              style: textStyleSofiaSB(
                                13,
                                postInfo.like.value ? white : fontColorDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
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
                          postInfo.comments != null
                              ? postInfo.comments.toString()
                              : "0",
                          style: textStyleSofiaSB(
                            13,
                            fontColorDark,
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
            onTap: () {},
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
                  color: fontColorDark,
                ),
              ),
            ),
          ),
          Spacer(),
          GetX<FetchNewsFeedController>(
            builder: (controller) {
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
                  color: postInfo.bookmark.value ? mango : fontColorDark,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  AppBar imageViewAppbar() {
    return AppBar(
      backgroundColor: transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(
        height: 40,
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () => Get.back(),
              child: Container(
                height: 35,
                width: 35,
                child: Icon(
                  Icons.chevron_left,
                  color: white,
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
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
                      16,
                      fontColorDark,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    postInfo.college,
                    style: textStyleGilroyM(
                      12,
                      fontColorDarkSub,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
