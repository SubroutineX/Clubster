import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:workflow/controllers/club_controller.dart';

// STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

//WIDGETS
import 'package:workflow/views/widgets/club_card_horizontal.dart';
import 'package:workflow/views/widgets/club_card_vertical.dart';

class ClubViewBody extends StatelessWidget {
  final clubController = Get.put(ClubController());

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          backgroundColor: bw(),
          elevation: 0,
          expandedHeight: 50,
          title: Container(
            height: 48,
            decoration: BoxDecoration(
              color: inputFieldColor(),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search...",
                    hintStyle: textStyleSofiaR(
                      16,
                      inputFontColor(),
                    ),
                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Icon(
                      Icons.search,
                      color: inputFontColor(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: violet.withOpacity(.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Learn something new\neveryday",
                                style: TextStyle(
                                  fontFamily: "Gilroy_Bold",
                                  fontSize: 17,
                                  color: violet,
                                ),
                              ),
                              Text(
                                "Join new clubs and learn \nnew things",
                                style: TextStyle(
                                  fontFamily: "Gilroy_Medium",
                                  fontSize: 14,
                                  color: violet.withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Center(
                              child: Image.asset("assets/images/team.png"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Explore genres",
                          style: textStyleSofiaSB(
                            18,
                            colorFont(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: deviceDimensions.width,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              for (int i = 0; i < genres.length; i++)
                                genreBuilder(
                                  genres[i].name,
                                  genres[i].imagePath,
                                  genres[i].servingRestaurants,
                                  genres[i].backgroungColor,
                                )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Popular ",
                                style: textStyleSofiaSB(
                                  18,
                                  violet,
                                ),
                              ),
                              TextSpan(
                                text: "Clubs",
                                style: textStyleSofiaSB(
                                  18,
                                  fontColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: deviceDimensions.width,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: GetX<ClubController>(
                          builder: (controller) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  for (int i = 0;
                                      i < controller.clubs.length;
                                      i++)
                                    if (controller.clubs[i].elite == "Yes")
                                      ClubCardVertical(
                                        clubInfo: controller.clubs[i],
                                      ),
                                  SizedBox(width: 5),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Other ",
                                style: textStyleSofiaSB(
                                  18,
                                  violet,
                                ),
                              ),
                              TextSpan(
                                text: "Clubs",
                                style: textStyleSofiaSB(
                                  18,
                                  fontColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      GetX<ClubController>(
                        builder: (controller) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                for (int j = 0;
                                    j < controller.clubs.length;
                                    j++)
                                  if (controller.clubs[j].elite == "No")
                                    ClubCardVertical(
                                      clubInfo: controller.clubs[j],
                                    ),
                                SizedBox(width: 5),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
