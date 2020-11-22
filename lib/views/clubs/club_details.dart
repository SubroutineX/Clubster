import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ClubDetailsPage extends StatelessWidget {
  dynamic clubInfoPage;

  ClubDetailsPage({Key key, @required this.clubInfoPage});

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: Container(
        width: deviceDimensions.width,
        padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: fontColor.withOpacity(.1),
              offset: Offset(0, -3),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              shape: StadiumBorder(),
              color: violet,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  print("hello");
                },
                focusColor: violetSplash,
                highlightColor: violetSplash,
                splashColor: violetSplash,
                hoverColor: violetSplash,
                child: Container(
                  height: 48,
                  width: deviceDimensions.width * .55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Join",
                      style: joinStyle,
                    ),
                  ),
                ),
              ),
            ),
            Material(
              shape: StadiumBorder(),
              color: blue,
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  print("hello");
                },
                focusColor: blueSplash,
                highlightColor: blueSplash,
                splashColor: blueSplash,
                hoverColor: blueSplash,
                child: Container(
                  height: 48,
                  width: deviceDimensions.width * .35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Follow",
                      style: joinStyle,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: deviceDimensions.width,
          height: deviceDimensions.height,
          child: SlidingSheet(
            cornerRadius: 30,
            scrollSpec: ScrollSpec.bouncingScroll(),
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.6, 1],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: deviceDimensions.width,
                    height: deviceDimensions.height * 0.45,
                    child: Hero(
                      tag: clubInfoPage.id,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          clubInfoPage.imgUrl,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: deviceDimensions.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(closeOverlays: true),
                          icon: Icon(
                            Icons.chevron_left,
                            color: white,
                            size: 35,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(20),
                height: deviceDimensions.height * .78,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeAnimation(
                              20,
                              Text(
                                clubInfoPage.name,
                                style: productDetailTitleStyle,
                              ),
                            ),
                            SizedBox(height: 10),
                            FadeAnimation(
                              25,
                              Text(
                                clubInfoPage.id,
                                style: idDetailStyle,
                              ),
                            ),
                          ],
                        ),
                        FadeAnimation(
                          20,
                          Container(
                            width: 90,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[200],
                                          blurRadius: 10)
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: true
                                        ? Icon(
                                            Icons.bookmark_rounded,
                                            color: yellow,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.bookmark_outline_rounded,
                                            color: Colors.grey[600],
                                            size: 20,
                                          ),
                                  ),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[200],
                                          blurRadius: 10)
                                    ],
                                  ),
                                  child: Center(
                                    child: true
                                        ? Icon(
                                            Icons.favorite_rounded,
                                            color: red,
                                            size: 20,
                                          )
                                        : Icon(
                                            Icons.favorite_outline_rounded,
                                            color: Colors.grey[600],
                                            size: 20,
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _showAsBottomSheet();
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                FadeAnimation(
                                  30,
                                  Text(
                                    "Members",
                                    style: catHeadDetailStyle,
                                  ),
                                ),
                                SizedBox(height: 10),
                                FadeAnimation(
                                  35,
                                  Text(
                                    clubInfoPage.members.toString(),
                                    style: catDetailStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FadeAnimation(
                                30,
                                Text(
                                  "Status",
                                  style: catHeadDetailStyle,
                                ),
                              ),
                              SizedBox(height: 10),
                              FadeAnimation(
                                35,
                                Text(
                                  clubInfoPage.status,
                                  style: catDetailStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    FadeAnimation(
                      45,
                      Text(
                        "Description",
                        style: descriptionTitleStyle,
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeAnimation(
                      50,
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        style: descriptionStyle,
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showAsBottomSheet() async {
    await showSlidingBottomSheet(
      Get.context,
      builder: (context) {
        var deviceDimensions = MediaQuery.of(context).size;
        return SlidingSheetDialog(
          duration: Duration(milliseconds: 250),
          scrollSpec: ScrollSpec.bouncingScroll(),
          elevation: 0,
          cornerRadius: 30,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.4, 0.7, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          builder: (context, state) {
            return Material(
              color: white,
              child: Container(
                height: deviceDimensions.height * 0.60,
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Members",
                              style: memberHeadStyle,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "Founder",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(width: 20),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      color: violet,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "President",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
