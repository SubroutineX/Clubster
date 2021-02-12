import 'package:flutter/material.dart';
import 'package:workflow/views/clubs/club_profile/club_profile_body.dart';

//PAGES
import 'package:workflow/views/clubs/club_view/clubs_view_body.dart';

// STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clubsBackground,
      appBar: profilePageAppBar(),
      body: ProfilePageBody(),
    );
  }

  AppBar profilePageAppBar() {
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
          tooltip: "Settings",
          icon: Icon(
            Icons.settings_outlined,
            color: fontColor,
          ),
        ),
      ],
      iconTheme: IconThemeData(color: fontColor),
      centerTitle: true,
      backgroundColor: transparent,
      elevation: 0,
      title: Text(
        "Profile",
        style: textStyleSofiaSB(18, fontColor),
      ),
    );
  }
}
