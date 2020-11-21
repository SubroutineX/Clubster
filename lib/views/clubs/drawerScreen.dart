import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      width: double.infinity,
      color: violet,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: white,
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nikhil Shinde",
                    style: profileName,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Computer Science",
                    style: profileDesc,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 80),
          Container(
            padding: EdgeInsets.only(left: 13),
            child: Row(
              children: [
                Icon(
                  Icons.dashboard_outlined,
                  color: white.withOpacity(0.6),
                ),
                SizedBox(width: 10),
                Text(
                  "Dashboard",
                  style: inActivelistTile,
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(left: 13),
            child: Row(
              children: [
                Icon(
                  Icons.group_outlined,
                  color: white,
                ),
                SizedBox(width: 10),
                Text(
                  "Clubs",
                  style: activelistTile,
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(left: 13),
            child: Row(
              children: [
                Icon(
                  Icons.library_books_outlined,
                  color: white.withOpacity(0.6),
                ),
                SizedBox(width: 10),
                Text(
                  "Library",
                  style: inActivelistTile,
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(left: 13),
            child: Row(
              children: [
                Icon(
                  Icons.kitchen_outlined,
                  color: white.withOpacity(0.6),
                ),
                SizedBox(width: 10),
                Text(
                  "Canteen",
                  style: inActivelistTile,
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(left: 13),
            child: Row(
              children: [
                Icon(
                  Icons.settings_outlined,
                  color: white.withOpacity(0.6),
                ),
                SizedBox(width: 10),
                Text(
                  "Settings",
                  style: inActivelistTile,
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            padding: EdgeInsets.only(left: 13),
            child: Row(
              children: [
                Icon(
                  Icons.login_outlined,
                  color: white.withOpacity(0.6),
                ),
                SizedBox(width: 10),
                Text(
                  "Logout",
                  style: inActivelistTile,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
