import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/controllers/comments_controller.dart';
import 'package:workflow/controllers/fetch_news_feed_controller.dart';
import 'package:workflow/models/comments_model.dart';
import 'package:workflow/models/news_feed.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';
import 'package:workflow/views/widgets/comment_widgets.dart';
import 'package:get/get.dart';

class CommentPage extends StatefulWidget {
  final NewsFeed postInfo;
  final int index;

  CommentPage({Key key, @required this.postInfo, this.index}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState(postInfo, index);
}

class _CommentPageState extends State<CommentPage> {
  String sarangImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6U_jEzon-GPDSWxhyqMilPNU9DxVYYXfyxg&usqp=CAU";

  final commentsController = Get.put(CommentsController());

  TextEditingController comment = TextEditingController();
  final newsFeedController = Get.find<FetchNewsFeedController>();

  final animationKey = GlobalKey<AnimatedListState>();
  final NewsFeed postInfo;
  final int index;

  _CommentPageState(this.postInfo, this.index);
  // ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    commentsController.fetchComments(
      postInfo.id,
      index,
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: commentInput(context, deviceDimensions),
      backgroundColor: bw(),
      body: Transform.translate(
        offset: MediaQuery.of(context).viewInsets.bottom != 0
            ? Offset(0, -70)
            : Offset(0.0, 0),
        child: CustomScrollView(
          reverse: true,
          // controller: scrollController,
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              backgroundColor: bw(),
              expandedHeight: 126,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
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
                                Obx(
                                  () => Text(
                                    "Comments " +
                                        "(" +
                                        newsFeedController
                                            .newsFeed[index].comments
                                            .toString() +
                                        ")",
                                    style: textStyleGilroySB(
                                      20,
                                      colorFont(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      PostInfo(
                        postImageUrl:
                            "http://65.1.43.39:8000/fetchNewsImage?imageName=" +
                                widget.postInfo.fileName,
                        postProfileName: widget.postInfo.user,
                        caption: widget.postInfo.caption,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(
                () => Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom != 0
                          ? 100
                          : 30,
                    ),
                    for (int i = 0; i < commentsController.comments.length; i++)
                      CommentBuilder(
                        commentInfo: commentsController.comments[i],
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Transform commentInput(BuildContext context, Size deviceDimensions) {
    return Transform.translate(
      offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: deviceDimensions.width,
        color: bw(),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: inputFieldColor(),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    if (comment.text.isEmpty) {
                      Get.snackbar(
                          "Empty comment", "Please enter a comment to post");
                    } else {
                      commentsController.addComment(
                          comment.text, widget.postInfo.id, index);
                      commentsController.comments.add(
                        Comment(
                          user: Get.find<AuthController>()
                                      .currentUser
                                      .userName !=
                                  null
                              ? Get.find<AuthController>().currentUser.userName
                              : "currentUser.name",
                          text: comment.text,
                          timeStamp: "now",
                        ),
                      );
                      Get.snackbar(
                          "Comment posted", "Your comment has been posted");
                      comment.clear();
                      Timer(
                        Duration(milliseconds: 500),
                        () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: neonBlue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    height: 50,
                    padding: EdgeInsets.only(left: 10, right: 20),
                    width: 100,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.send,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: deviceDimensions.width - 100,
                height: 50,
                decoration: BoxDecoration(
                  color: inputFieldColor(),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/images/cricket.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: deviceDimensions.width - 165,
                      child: TextFormField(
                        style: textStyleGilroyM(
                          16,
                          colorFont(),
                        ),
                        controller: comment,
                        maxLines: null,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add comment",
                          hintStyle: textStyleSofiaR(
                            16,
                            colorFontLight(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
