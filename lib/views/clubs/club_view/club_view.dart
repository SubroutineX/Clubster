import 'dart:ui';

import 'package:flutter/material.dart';

//PAGES
import 'package:workflow/views/clubs/club_view/clubs_view_body.dart';

// STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ClubView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(1, -1),
          colors: [
            blue,
            Color(0xffffffff),
          ],
          radius: .85,
          focal: Alignment(0.9, -1),
        ),
      ),
      child: BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Scaffold(
          backgroundColor: transparent,
          appBar: clubViewAppBar(),
          body: ClubViewBody(),
        ),
      ),
    );
  }

  AppBar clubViewAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: fontColor),
      centerTitle: true,
      backgroundColor: transparent,
      elevation: 0,
      title: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search...",
                hintStyle: searchBarStyle,
                contentPadding: EdgeInsets.zero,
                prefixIcon: Icon(
                  Icons.search,
                  color: fontColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
