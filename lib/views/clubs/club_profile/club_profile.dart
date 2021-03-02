import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/views/clubs/club_profile/club_profile_pageHeader.dart';
import 'package:workflow/views/clubs/club_profile/custom_clipper.dart';
import 'package:workflow/views/clubs/club_profile/profile_image.dart';
import 'package:workflow/views/clubs/club_profile/profile_tabviewcontent.dart';
import 'package:workflow/views/clubs/club_settings/settings.dart';

//PAGES
import 'package:workflow/views/clubs/club_view/clubs_view_body.dart';

// STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class ProfilePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            snap: false,
            pinned: false,
            floating: true,
            expandedHeight: 700,
            flexibleSpace: FlexibleSpaceBar(
              background: ProfilePageheader(),
            ),
            backgroundColor: transparent,
          ),
          SliverToBoxAdapter(
            child: ProfileTabview(),
          ),
        ],
      ),
    );
  }
}
