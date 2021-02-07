import "package:flutter/material.dart";

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:workflow/controllers/navigation_controller.dart';

//PAGES
import 'package:workflow/views/clubs/club_nav/custom_bottomNav.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Container(
      width: deviceDimensions.width - deviceDimensions.width * 0.1,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: fontColor.withOpacity(.40),
            blurRadius: 15,
            offset: Offset(0, 1.8),
            spreadRadius: -7,
          )
        ],
        color: white,
        borderRadius: BorderRadius.circular(60),
      ),
      child: GetBuilder(
          init: Get.find<NavigationController>(),
          builder: (_controller) {
            return CustomBottomBar(
              curve: Curves.bounceOut,
              duration: Duration(milliseconds: 500),
              currentIndex: _controller.currentIndex,
              onTap: (index) {
                _controller.selectTab(_controller.pageKeys[index], index);
              },
              unselectedItemColor: fontColorLight,
              items: [
                CustomBottomBarItem(
                  icon: Icon(Icons.add),
                  title: Text(
                    "Create",
                    textScaleFactor: 1,
                  ),
                  selectedColor: teal,
                ),
                CustomBottomBarItem(
                  icon: Icon(Icons.search_rounded),
                  title: Text(
                    "Search",
                    textScaleFactor: 1,
                  ),
                  selectedColor: neonBlue,
                ),
                CustomBottomBarItem(
                  icon: Icon(Icons.dynamic_feed_outlined),
                  title: Text(
                    "Feed",
                    textScaleFactor: 1,
                  ),
                  selectedColor: Colors.pink,
                ),
                CustomBottomBarItem(
                  icon: Icon(Icons.bookmark_outline_rounded),
                  title: Text(
                    "Bookmarks",
                    textScaleFactor: 1,
                  ),
                  selectedColor: Colors.orange,
                ),
                CustomBottomBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  title: Text(
                    "Profile",
                    textScaleFactor: 1,
                  ),
                  selectedColor: Colors.blueAccent,
                ),
              ],
            );
          }),
    );
  }
}
