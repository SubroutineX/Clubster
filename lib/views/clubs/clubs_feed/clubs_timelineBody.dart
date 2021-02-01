import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:workflow/views/CustomIcons.dart';
import 'package:workflow/views/clubs/clubs_feed/imageDisplay.dart';
import 'package:workflow/views/clubs/clubs_upload/upload_img.dart';
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
                      UploadImage(),
                    );
                  },
                  storyName: "Upload",
                  localUrl: "assets/images/profile.jpg",
                ),
                SizedBox(
                  width: 30,
                ),
                Story(
                  storyName: "abhijeet ppt",
                  storyUrl:
                      "https://images.unsplash.com/photo-1505373877841-8d25f7d46678?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1300&q=80",
                ),
                SizedBox(
                  width: 10,
                ),
                Story(
                  storyName: "HH dance workshop",
                  storyUrl:
                      "https://images.unsplash.com/photo-1523450001312-faa4e2e37f0f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
                ),
                SizedBox(
                  width: 10,
                ),
                Story(
                    storyName: "TATA motors",
                    storyUrl:
                        "https://images.unsplash.com/photo-1609362092873-66a50ae6ee1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
                SizedBox(
                  width: 10,
                ),
                Story(
                    storyName: "python upskill",
                    storyUrl:
                        "https://images.unsplash.com/photo-1565801802606-9923415ee1eb?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1385&q=80"),
                SizedBox(
                  width: 10,
                ),
                Story(
                    storyName: "css Upskill",
                    storyUrl:
                        "https://images.unsplash.com/photo-1587620962725-abab7fe55159?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80"),
                SizedBox(
                  width: 10,
                ),
                Story(
                    storyName: "Gust lec",
                    storyUrl:
                        "https://images.unsplash.com/photo-1506978520653-bb3accebb1a3?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Z3VzdHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60"),
                SizedBox(
                  width: 10,
                ),
                Story(
                    storyName: "Sex education",
                    storyUrl:
                        "https://images.unsplash.com/photo-1582944682702-8d357814f820?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"),
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
  }) : super(key: key);
  final String storyUrl;
  final String storyName;
  final String localUrl;
  final VoidCallback onTapCall;

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
              child: localUrl != null
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
