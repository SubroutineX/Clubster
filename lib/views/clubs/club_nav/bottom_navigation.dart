import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workflow/models/clubs.dart';
import 'package:workflow/views/clubs/club_nav/create_club.dart';
import 'package:workflow/views/clubs/club_nav/custom_bottomNav.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class CustomBottomNav extends StatefulWidget {
  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

enum _SelectedTab { home, likes, search, profile, clash }

class _CustomBottomNavState extends State<CustomBottomNav> {
  var _selectedTab = _SelectedTab.home;
  int _currentIndex = 0;

  final List<Widget> _children = [
    CreateCulb(),
  ];

  void _handleIndexChanged(int i) {
    setState(() {
      _currentIndex = i;
      _selectedTab = _SelectedTab.values[i];
      print(MediaQuery.of(context).size.width);
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Container(
      body: _children[_currentIndex],
      width: deviceDimensions.width,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: CustomBottomBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        //  onTap: onTappedBar,
        // currentIndex: _currentIndex,
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
              "Clash",
              textScaleFactor: 1,
            ),
            selectedColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
