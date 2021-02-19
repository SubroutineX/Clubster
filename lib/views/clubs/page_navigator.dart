import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/controllers/navigation_controller.dart';

//PAGES
import 'package:workflow/views/clubs/club_nav/bottom_navigation.bak';
import 'package:workflow/views/clubs/club_nav/bottom_navbar.dart';
import 'package:workflow/views/clubs/club_profile/club_profile.dart';
import 'package:workflow/views/clubs/club_view/clubs_view_body.dart';
import 'package:workflow/views/clubs/create/createTabs.dart';
import 'package:workflow/views/clubs/tab_navigator.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class PageNavigator extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final authController = Get.put(AuthController());
  final navBarController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: NavigationController(),
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            if (_.currentPage == "Page3") {
              return Future.value(true);
            } else {
              _.selectTab("Page3", 2);
              return Future.value(false);
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Stack(
                children: [
                  buildOffstage(_, "Page1"),
                  buildOffstage(_, "Page2"),
                  buildOffstage(_, "Page3"),
                  buildOffstage(_, "Page4"),
                  buildOffstage(_, "Page5"),
                ],
              ),
              Positioned(
                bottom: 10,
                child: BottomNavBar(),
              )
            ],
          ),
        );
      },
    );
  }

  Offstage buildOffstage(_, String tabItem) {
    return Offstage(
      offstage: _.currentPage != tabItem,
      child: TabNavigator(
        navigatorKey: _.navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
