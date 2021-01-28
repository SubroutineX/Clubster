import 'package:flutter/material.dart';

//PAGES
import 'package:workflow/views/clubs/club_view/clubs_view_body.dart';

// STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ClubView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clubsBackground,
      appBar: clubViewAppBar(),
      body: ClubViewBody(),
    );
  }

  AppBar clubViewAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
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
        ),
      ],
      iconTheme: IconThemeData(color: fontColor),
      centerTitle: true,
      backgroundColor: transparent,
      elevation: 0,
      title: Text(
        "Clubs",
        style: textStyleSB(18, fontColor),
      ),
    );
  }
}
