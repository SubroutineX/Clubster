import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';

//PACKAGES
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';

//STYLES
import 'package:workflow/views/styles/styles.dart';

//WIDGETS
import 'package:workflow/views/widgets/buttonBuilder.dart';
import 'package:workflow/views/widgets/clubMembersBottomSheet.dart';

class ClubDetailSheet extends StatelessWidget {
  const ClubDetailSheet({
    Key key,
    @required this.page,
  }) : super(key: key);

  final dynamic page;

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
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
                      page.clubName,
                      style: productDetailTitleStyle,
                    ),
                  ),
                  SizedBox(height: 10),
                  FadeAnimation(
                    25,
                    Text(
                      "100",
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
                      BookmarkButtonBuilder(
                        pageInfo: page,
                        size: 38,
                        iconSize: 20,
                      ),
                      LikeButtonBuilder(
                        pageInfo: page,
                        size: 38,
                        iconSize: 20,
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                        page.genre,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  page.status,
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                        page.members.toString(),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  page.followers.toString(),
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
                        page.description,
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
  }

  void _showAsBottomSheet() async {
    await showSlidingBottomSheet(
      Get.context,
      builder: (context) {
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
            return ClubMembersBottomSheet();
          },
        );
      },
    );
  }
}
