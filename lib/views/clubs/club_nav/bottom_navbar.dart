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
      width: deviceDimensions.width,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: fontColor.withOpacity(.05),
            blurRadius: 8,
          )
        ],
        color: white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: GetBuilder(
          init: Get.find<NavigationController>(),
          builder: (_controller) {
            return CustomBottomBar(
              currentIndex: _controller.currentIndex,
              onTap: (index) {
                _controller.selectTab(_controller.pageKeys[index], index);
              },
              items: [
                CustomBottomBarItem(
                  icon: Icon(Icons.group_outlined),
                  title: Text(
                    "Clubs",
                    textScaleFactor: 1,
                  ),
                  selectedColor: violet,
                ),
                CustomBottomBarItem(
                  icon: Icon(Icons.favorite_border_rounded),
                  title: Text(
                    "Favourite",
                    textScaleFactor: 1,
                  ),
                  selectedColor: Colors.pink,
                ),
                CustomBottomBarItem(
                  icon: Icon(Icons.add),
                  title: Text(
                    "Create",
                    textScaleFactor: 1,
                  ),
                  selectedColor: Colors.teal,
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
