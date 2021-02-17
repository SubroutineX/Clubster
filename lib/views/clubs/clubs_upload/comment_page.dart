import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workflow/models/news_feed.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';
import 'package:workflow/views/widgets/comment_widgets.dart';

class CommentPage extends StatelessWidget {
  String sarangImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6U_jEzon-GPDSWxhyqMilPNU9DxVYYXfyxg&usqp=CAU";

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
                Comment(
                  name: "Abhijeet Takale",
                  time: "20sec ago",
                  comment: "Euuuuuu",
                  likes: 28,
                  profileImgUrl:
                      "https://images.unsplash.com/photo-1577933679437-f3171f9b963a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80",
                ),
                Comment(
                  name: "Sushant Shivalkar",
                  time: "30min ago",
                  comment: "@shivam Let's party!!! mother******",
                  likes: 2000,
                  profileImgUrl:
                      "https://www.famousbirthdays.com/headshots/just-sul-1.jpg",
                ),
                Comment(
                  name: "Shivam Gawade",
                  time: "1hr ago",
                  comment: "@Abhijeet Parnika mazhi ahe",
                  likes: 250000000,
                  profileImgUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWXHT2n5HIzscj3cf1jNJOz44jFCN9aYdFbg&usqp=CAU",
                ),
                Comment(
                  name: "Sarang kawade",
                  time: "3hr ago",
                  comment:
                      "@sushant Please next time mala pan bolva mi mazhe paise bharto! ",
                  likes: 31,
                  profileImgUrl: sarangImage,
                ),
                Comment(
                  name: "Atharva Palande",
                  time: "8hr ago",
                  comment: "No load ",
                  likes: 101,
                  profileImgUrl:
                      "https://www.askideas.com/media/37/Funny-Eagle-Haircuts-For-Men.jpg",
                ),
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
                  onTap: () => print("hellllo posted"),
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
