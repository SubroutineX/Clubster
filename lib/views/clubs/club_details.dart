import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:workflow/controllers/club_controller.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ClubDetailsPage extends StatelessWidget {
  dynamic clubInfoPage;
  final cController = Get.find<ClubController>();

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
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
                height: deviceDimensions.height * .78,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
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
                                textScaleFactor: 1,
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
                                    child: GetX<ClubController>(
                                      builder: (controller) {
                                        return IconButton(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          onPressed: () {
                                            clubInfoPage.bookmark.value =
                                                !clubInfoPage.bookmark.value;
                                          },
                                          icon: clubInfoPage.bookmark.value
                                              ? Icon(
                                                  Icons.bookmark_rounded,
                                                  size: 20,
                                                )
                                              : Icon(
                                                  Icons
                                                      .bookmark_outline_rounded,
                                                  size: 20,
                                                ),
                                          color: clubInfoPage.bookmark.value
                                              ? yellow
                                              : Colors.grey[600],
                                        );
                                      },
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
                                        blurRadius: 10,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child: GetX<ClubController>(
                                      builder: (controller) {
                                        return IconButton(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          onPressed: () {
                                            clubInfoPage.like.value =
                                                !clubInfoPage.like.value;
                                          },
                                          icon: clubInfoPage.like.value
                                              ? Icon(
                                                  Icons.favorite_rounded,
                                                  size: 20,
                                                )
                                              : Icon(
                                                  Icons
                                                      .favorite_outline_rounded,
                                                  size: 20,
                                                ),
                                          color: clubInfoPage.like.value
                                              ? red
                                              : Colors.grey[600],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          FadeAnimation(
                                            30,
                                            Text(
                                              "Genre",
                                              style: catHeadDetailStyle,
                                              textScaleFactor: 1,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          FadeAnimation(
                                            35,
                                            Row(
                                              children: [
                                                Text(
                                                  clubInfoPage.genre,
                                                  style: catDetailStyle,
                                                  textScaleFactor: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FadeAnimation(
                                          30,
                                          Text(
                                            "Status",
                                            style: catHeadDetailStyle,
                                            textScaleFactor: 1,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        FadeAnimation(
                                          35,
                                          Text(
                                            clubInfoPage.status,
                                            style: catDetailStyle,
                                            textScaleFactor: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 22),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        _showAsBottomSheet();
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          FadeAnimation(
                                            30,
                                            Text(
                                              "Members",
                                              style: catHeadDetailStyle,
                                              textScaleFactor: 1,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          FadeAnimation(
                                            35,
                                            Row(
                                              children: [
                                                Text(
                                                  clubInfoPage.members
                                                      .toString(),
                                                  style: catDetailStyle,
                                                  textScaleFactor: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 30),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FadeAnimation(
                                          30,
                                          Text(
                                            "Followers",
                                            style: catHeadDetailStyle,
                                            textScaleFactor: 1,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        FadeAnimation(
                                          35,
                                          Text(
                                            clubInfoPage.followers.toString(),
                                            style: catDetailStyle,
                                            textScaleFactor: 1,
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
                                  textScaleFactor: 1,
                                ),
                              ),
                              SizedBox(height: 20),
                              FadeAnimation(
                                50,
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                  style: descriptionStyle,
                                  textScaleFactor: 1,
                                ),
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
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
                                textScaleFactor: 1,
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
                                textScaleFactor: 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              for (int i = 0; i < 5; i++) ClubMemberCard(),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ClubMemberCard extends StatelessWidget {
  const ClubMemberCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: clubsBackground2.withOpacity(.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/inventors.jpg"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nupsi (male)",
                        style: memberName,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CS",
                            style: memberInfo,
                          ),
                          Text(
                            "husband",
                            style: memberInfo,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 25,
              width: 40,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(.05),
                    blurRadius: 1,
                    offset: Offset(-1, 1),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Stack(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: fontColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
