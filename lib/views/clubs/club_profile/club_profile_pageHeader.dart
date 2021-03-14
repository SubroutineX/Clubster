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
import 'package:workflow/views/clubs/club_view/clubs_view_body.dart';

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
          height: 5,
        ),
        SizedBox(
          height: 10,
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
