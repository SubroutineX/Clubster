import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/controllers/navigation_controller.dart';

//PAGES
import 'package:workflow/views/clubs/club_nav/bottom_navigation.dart';
import 'package:workflow/views/clubs/club_view/clubs_view.dart';
import 'package:workflow/views/clubs/create/createTabs.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ClubHome extends StatelessWidget {
  final authController = Get.put(AuthController());

  final navBarController = Get.put(ClubNavigationController());

  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ClubNavigationController(),
      builder: (_controller) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: clubsBackground,
          drawer: Drawer(),
          appBar: clubAppBar(),
          body: PageView(
            controller: _controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              _controller.changeIndex(index);
            },
            children: [
              ClubView(),
              Container(
                color: clubsBackground,
                child: Center(
                  child: Text(
                    "Favourites",
                  ),
                ),
              ),
              CreatePage(),
              Container(
                color: clubsBackground,
                child: Center(
                  child: Text(
                    "Bookmarks",
                  ),
                ),
              ),
              Container(
                color: clubsBackground,
                child: Center(
                  child: Text(
                    "Profile",
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: CustomBottomNav(),
        );
      },
    );
  }

  AppBar clubAppBar() {
    return AppBar(
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
    );
  }
}
