import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:workflow/views/clubs/custom_bottomNav.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class CustomBottomNav extends StatefulWidget {
  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

enum _SelectedTab { home, likes, search, profile, clash }

class _CustomBottomNavState extends State<CustomBottomNav> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      print(MediaQuery.of(context).size.width);
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Container(
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
        items: [
          CustomBottomBarItem(
            icon: Icon(Icons.group_outlined),
            title: Text("Clubs"),
            selectedColor: violet,
          ),
          CustomBottomBarItem(
            icon: Icon(Icons.favorite_border_rounded),
            title: Text("Favourite"),
            selectedColor: Colors.pink,
          ),
          CustomBottomBarItem(
            icon: Icon(Icons.add),
            title: Text("Create"),
            selectedColor: Colors.teal,
          ),
          CustomBottomBarItem(
            icon: Icon(Icons.bookmark_outline_rounded),
            title: Text("Bookmarks"),
            selectedColor: Colors.orange,
          ),
          CustomBottomBarItem(
            icon: Icon(Icons.person_outline_rounded),
            title: Text("Clash"),
            selectedColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}
