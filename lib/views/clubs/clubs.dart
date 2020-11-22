import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/club_controller.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/clubs/club_cards/club_card_horizontal.dart';
import 'package:workflow/views/clubs/club_cards/club_card_vertical.dart';
import 'package:workflow/views/clubs/club_nav/bottom_navigation.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class Clubs extends StatelessWidget {
  final clubController = Get.put(ClubController());

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: clubsBackground,
      drawer: Drawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: fontColor,
          ),
        ),
        actions: [
          IconButton(
              tooltip: "Logout",
              icon: Icon(
                Icons.login_outlined,
                color: fontColor,
              ),
              onPressed: () {}),
        ],
        iconTheme: IconThemeData(color: fontColor),
        centerTitle: true,
        backgroundColor: transparent,
        elevation: 0,
        title: Text(
          "Clubs",
          style: appBarHead,
        ),
      ),
      body: Container(
        height: deviceDimensions.height,
        width: deviceDimensions.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          1,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Popular",
                              style: appBarHead,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 220,
                          width: deviceDimensions.width,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: GetX<ClubController>(builder: (controller) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Row(
                                children: [
                                  SizedBox(width: 20),
                                  for (int i = 0;
                                      i < controller.clubs.length;
                                      i++)
                                    if (controller.clubs[i].popular)
                                      ClubCardVertical(
                                        clubInfoCard: controller.clubs[i],
                                      ),
                                  SizedBox(width: 5),
                                ],
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          1,
                          Text(
                            "Other",
                            style: appBarHead,
                          ),
                        ),
                        SizedBox(height: 20),
                        GetX<ClubController>(builder: (controller) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                for (int j = 0;
                                    j < controller.clubs.length;
                                    j++)
                                  if (!controller.clubs[j].popular)
                                    ClubCardHorizontal(
                                      clubInfoCard: controller.clubs[j],
                                    ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: deviceDimensions.width,
                padding: EdgeInsets.symmetric(horizontal: 22),
                height: 70,
                decoration: BoxDecoration(
                  color: clubsBackground,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        )
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, right: 12),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search clubs...",
                            hintStyle: searchBarStyle,
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: CustomBottomNav(),
            )
          ],
        ),
      ),
    );
  }
}
