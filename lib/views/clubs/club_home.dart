import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/controllers/navigation_controller.dart';
import 'package:workflow/views/clubs/club_nav/bottom_navigation.dart';
import 'package:workflow/views/clubs/clubs_view.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ClubHome extends StatelessWidget {
  final authController = Get.put(AuthController());

  final navBarController = Get.put(ClubNavigationController());

  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return GetBuilder(
      init: ClubNavigationController(),
      builder: (_controller) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: clubsBackground,
          drawer: Drawer(),
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState.openDrawer();
              },
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
                onPressed: () {
                  authController.logoutUser();
                },
              ),
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
          body: PageView(
            controller: _controller.pageController,
            onPageChanged: (index) {
              _controller.changeIndex(index);
            },
            children: [
              ClubView(),
              Container(
                color: clubsBackground,
              ),
            ],
          ),
          bottomNavigationBar: CustomBottomNav(),
        );
      },
    );
  }
}
