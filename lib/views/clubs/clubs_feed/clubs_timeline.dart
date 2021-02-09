import 'package:flutter/material.dart';
import 'package:workflow/views/clubs/clubs_feed/newFeed.dart';
import 'package:workflow/views/styles/gradientScaffold.dart';

class Clubtimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultGradientScaffold(
      body: Feed(),
    );
  }
}
