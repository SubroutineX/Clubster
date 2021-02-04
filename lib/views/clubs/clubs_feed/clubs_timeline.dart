import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/views/clubs/clubs_feed/clubs_timelineBody.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/icons.dart';
import 'package:workflow/views/styles/styles.dart';

class Clubtimeline extends StatelessWidget {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: transparent,
          leading: IconButton(
            onPressed: () => print("svg"),
            icon: SvgPicture.asset(
              menuIcon,
              color: fontColor,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            "Clubster",
            style: textStyleL(18, fontColor),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              tooltip: "Logout",
              icon: Icon(
                Icons.login_outlined,
                color: fontColor,
              ),
              onPressed: () {
                authController.logoutUser();
              },
            ),
          ],
        ),
        body: Timeline(),
      ),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(1, -1),
          colors: [
            Colors.pink,
            Color(0xffffffff),
          ],
          radius: .80,
          focal: Alignment(0.9, -1),
        ),
      ),
    );
  }
}
