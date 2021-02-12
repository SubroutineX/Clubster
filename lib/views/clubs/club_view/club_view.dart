import 'dart:ui';

import 'package:flutter/material.dart';

//PAGES
import 'package:workflow/views/clubs/club_view/clubs_view_body.dart';

// STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/gradientScaffold.dart';
import 'package:workflow/views/styles/styles.dart';

class ClubView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultGradientScaffold(
      body: ClubViewBody(),
    );
  }
}
