import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/clubs/club_model/club_other_model.dart';
import 'package:workflow/views/clubs/club_other.dart';
import 'package:workflow/views/clubs/club_popular.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ClubDetailsPopular extends StatelessWidget {
  final PopularClubs clubInfo;

  ClubDetailsPopular({Key key, @required this.clubInfo});

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: deviceDimensions.width,
          height: deviceDimensions.height,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: deviceDimensions.width,
                  height: deviceDimensions.height * 0.45,
                  child: Hero(
                    tag: clubInfo.id,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(clubInfo.imgUrl),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: deviceDimensions.width,
                  height: deviceDimensions.height * 0.60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: white,
                  ),
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
                                  clubInfo.name,
                                  style: productDetailTitleStyle,
                                ),
                              ),
                              SizedBox(height: 10),
                              FadeAnimation(
                                25,
                                Text(
                                  clubInfo.id,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      child: clubInfo.bookmark
                                          ? Icon(
                                              Icons.bookmark_rounded,
                                              color: yellow,
                                              size: 16,
                                            )
                                          : Icon(
                                              Icons.bookmark_outline_rounded,
                                              color: Colors.grey[600],
                                              size: 16,
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
                                      child: clubInfo.like
                                          ? Icon(
                                              Icons.favorite_rounded,
                                              color: red,
                                              size: 16,
                                            )
                                          : Icon(
                                              Icons.favorite_outline_rounded,
                                              color: Colors.grey[600],
                                              size: 16,
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
                            child: GestureDetector(
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
                                      "12",
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
                                    clubInfo.status,
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
                    ],
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
                        onPressed: () => Get.back(),
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
        ),
      ),
    );
  }

  void _showAsBottomSheet() async {
    await showSlidingBottomSheet(
      Get.context,
      builder: (context) {
        return SlidingSheetDialog(
          duration: Duration(milliseconds: 250),
          scrollSpec: ScrollSpec.bouncingScroll(),
          elevation: 0,
          cornerRadius: 20,
          snapSpec: const SnapSpec(
            snap: true,
            snappings: [0.4, 0.7, 1.0],
            positioning: SnapPositioning.relativeToAvailableSpace,
          ),
          builder: (context, state) {
            return Material(
              color: white,
              child: Container(
                height: 360,
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        for (int j = 0; j < otherClubs.length; j++)
                          OtherClubs(
                            imgUrl: otherClubs[j].image,
                            name: otherClubs[j].name,
                            status: otherClubs[j].status,
                            id: otherClubs[j].id,
                            bookmark: otherClubs[j].bookmark,
                            like: otherClubs[j].like,
                          ),
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

    // This is the result.
  }
}
