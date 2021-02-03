import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:workflow/views/CustomIcons.dart';
import 'package:workflow/views/clubs/clubs_feed/imageDisplay.dart';
import 'package:workflow/views/clubs/clubs_upload/newUploadPage.dart';
import 'package:workflow/views/clubs/clubs_upload/upload_img.dart';
import 'package:workflow/views/clubs/clubs_upload/upload_img1.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/icons.dart';
import 'package:workflow/views/styles/styles.dart';

class Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Story(
                  onTapCall: () {
                    Get.to(
                      UploadNew(),
                    );
                  },
                  storyName: "Upload",
                  localUrl: "assets/images/profile.jpg",
                  upload: true,
                ),
                SizedBox(
                  width: 30,
                ),
                Story(
                  storyName: "Python",
                  localUrl: "assets/images/python.jpg",
                ),
                SizedBox(
                  width: 10,
                ),
                Story(
                  storyName: "Dance workshop",
                  localUrl: "assets/images/dance.jpg",
                ),
                SizedBox(
                  width: 10,
                ),
                Story(
                  storyName: "TATA motors",
                  localUrl: "assets/images/tata.jpg",
                ),
                SizedBox(
                  width: 10,
                ),
                Story(
                  storyName: "HTML/CSS",
                  localUrl: "assets/images/css.jpg",
                ),
                SizedBox(
                  width: 10,
                ),
                Story(
                  storyName: "Guest Lecture",
                  localUrl: "assets/images/guest.jpg",
                ),
                SizedBox(
                  width: 10,
                ),
                Story(
                  storyName: "Sing along",
                  localUrl: "assets/images/sing.jpg",
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          PostCard(
            profileImgUrl: "assets/images/cricket.jpg",
            postImgUrl: "assets/images/dance.jpg",
            name: "Nikhil Shinde",
            college: "D.Y.Patil",
            postDay: "today",
            likes: 50,
            comments: 43,
          ),
          SizedBox(
            height: 30,
          ),
          PostCard(
            profileImgUrl: "assets/images/inventors.jpg",
            postImgUrl: "assets/images/dancers.jpg",
            name: "Atharva Kulkarni",
            college: "R.S.C.O.E",
            postDay: "1d",
            likes: 50,
            comments: 43,
          ),
          SizedBox(
            height: 30,
          ),
          PostCard(
            profileImgUrl: "assets/images/inventors.jpg",
            postImgUrl: "assets/images/redline.jpg",
            name: "Atharva Kulkarni",
            college: "R.S.C.O.E",
            postDay: "1d",
            likes: 50,
            comments: 43,
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}

class Story extends StatelessWidget {
  const Story({
    Key key,
    this.storyName,
    this.storyUrl,
    this.onTapCall,
    this.localUrl,
    this.upload,
  }) : super(key: key);
  final String storyUrl;
  final String storyName;
  final String localUrl;
  final VoidCallback onTapCall;
  final bool upload;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: onTapCall,
              child: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: localUrl == null
                      ? Image.network(
                          storyUrl,
                          fit: BoxFit.cover,
                        )
                      : Image(
                          fit: BoxFit.cover,
                          image: AssetImage(localUrl),
                        ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: upload != null
                  ? Icon(
                      Icons.add,
                      size: 12,
                    )
                  : Container(),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          storyName.length > 8
              ? storyName.toString().substring(0, 8) + "..."
              : storyName,
          style: textStyleR(12, fontColor),
        ),
      ],
    );
  }
}

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
            aspectRatio: 16 / 9,
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
                  child: Hero(
                    tag: postImgUrl,
                    child: Image.asset(
                      postImgUrl,
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
