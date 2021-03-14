import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/controllers/profile_controller.dart';
import 'package:workflow/views/clubs/club_profile/custom_clipper.dart';
import 'package:workflow/views/clubs/club_profile/profile_image.dart';
import 'package:workflow/views/clubs/club_settings/settings.dart';

//PAGES

// STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class ProfilePageheader extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      fit: StackFit.expand,
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
          height: 25,
        ),
        Positioned(
          bottom: 150,
          child: Container(
            width: deviceWidth,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/underdev.png",
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Under Development",
                    style: textStyleGilroySB(
                      18,
                      colorFont(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
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
