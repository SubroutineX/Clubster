import 'package:flutter/material.dart';
import 'package:workflow/views/clubs/clubs_feed/club_feed_body.dart';
import 'package:workflow/views/styles/gradientScaffold.dart';

class ClubFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultGradientScaffold(
      body: ClubFeedBody(),
    );
  }
}
