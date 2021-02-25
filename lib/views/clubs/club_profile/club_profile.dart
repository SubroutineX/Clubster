import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/views/clubs/club_profile/club_profile_body.dart';
import 'package:workflow/views/clubs/club_profile/custom_clipper.dart';
import 'package:workflow/views/clubs/club_profile/profile_image.dart';
import 'package:workflow/views/clubs/club_settings/settings.dart';

//PAGES
import 'package:workflow/views/clubs/club_view/clubs_view_body.dart';

// STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class ProfilePage extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: bw(),
        body: Column(
          children: [
            Container(
              height: 300,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      height: 300,
                      child: Image.asset(
                        "assets/images/sing.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 190,
                    left: (deviceWidth / 2) - 52,
                    child: ProfileImage(),
                  ),
                  profilePageAppBar(),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Nikhil Shinde",
              style: textStyleGilroyB(
                18,
                colorFont(),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "Student | D.Y.Patil University",
              style: textStyleGilroyM(
                14,
                colorFontLight(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TabBar(
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: yellow,
              ),
              tabs: [
                Tab(
                  text: "My Posts",
                ),
                Tab(
                  text: "My Clubs",
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                PostCard(),
                                SizedBox(
                                  width: 5,
                                ),
                                PostCard(),
                                SizedBox(
                                  width: 5,
                                ),
                                PostCard(),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                PostCard(),
                                SizedBox(
                                  width: 5,
                                ),
                                PostCard(),
                                SizedBox(
                                  width: 5,
                                ),
                                PostCard(),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                PostCard(),
                                SizedBox(
                                  width: 5,
                                ),
                                PostCard(),
                                SizedBox(
                                  width: 5,
                                ),
                                PostCard(),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                PostCard(),
                                SizedBox(
                                  width: 5,
                                ),
                                PostCard(),
                                SizedBox(
                                  width: 5,
                                ),
                                PostCard(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // second tab bar viiew widget
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Created Clubs", style: tabLabelStyle),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 150,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  PostCard(),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  PostCard(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Following Clubs", style: tabLabelStyle),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 150,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: <Widget>[
                                  PostCard(),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  PostCard(),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  PostCard(),
                                ],
                              ),
                            ),
                          ],
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
    );
  }

  Widget profilePageAppBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              tooltip: "Logout",
              icon: Icon(
                Icons.logout,
                color: white,
              ),
              onPressed: () => authController.logoutUser(),
            ),
            IconButton(
              tooltip: "Settings",
              icon: Icon(
                Icons.settings_outlined,
                color: white,
              ),
              onPressed: () {
                Get.to(SettingsPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      width: 115,
      decoration: BoxDecoration(
        color: lightred,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
