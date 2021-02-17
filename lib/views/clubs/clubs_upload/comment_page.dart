import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workflow/controllers/comments_controller.dart';
import 'package:workflow/models/news_feed.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';
import 'package:workflow/views/widgets/comment_widgets.dart';
import 'package:get/get.dart';

class CommentPage extends StatelessWidget {
  String sarangImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6U_jEzon-GPDSWxhyqMilPNU9DxVYYXfyxg&usqp=CAU";
  final commentsController = Get.put(CommentsController());
  TextEditingController comment = TextEditingController();

  final NewsFeed postInfo;

  CommentPage({Key key, @required this.postInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: commentInput(context, deviceDimensions),
      backgroundColor: bw(),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            floating: true,
            backgroundColor: bw(),
            expandedHeight: 160,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
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
                              Text(
                                "Comments " +
                                    "(" +
                                    postInfo.comments.toString() +
                                    ")",
                                style: textStyleGilroySB(
                                  20,
                                  colorFont(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    PostInfo(
                      postImageUrl:
                          "http://65.1.43.39:8000/fetchNewsImage?imageName=" +
                              postInfo.fileName,
                      postProfileName: postInfo.user,
                      caption: postInfo.caption,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                for (int i = commentsController.comments.length - 1;
                    i >= 0;
                    i--)
                  CommentBuilder(
                    commentInfo: commentsController.comments[i],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }

  Transform commentInput(BuildContext context, Size deviceDimensions) {
    return Transform.translate(
      offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        width: deviceDimensions.width,
        color: transparent,
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
                  onTap: () =>
                      commentsController.addComment(comment.text, postInfo.id),
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
                          inputFontColor(),
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
