import 'package:flutter/material.dart';
import 'package:workflow/views/clubs/drawerScreen.dart';
import 'package:workflow/views/clubs/mainScreen.dart';

class Clubs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          MainScreen(),
        ],
      ),
    );
  }
}
