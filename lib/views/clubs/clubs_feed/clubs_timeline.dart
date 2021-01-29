import 'package:flutter/material.dart';
import 'package:workflow/views/clubs/clubs_feed/clubs_timelineBody.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class Clubtimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: transparent,
          title: Text(
            "Clubster",
            style: textStyleL(18, fontColor),
          ),
          centerTitle: true,
        ),
        body: Timeline(),
      ),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(1, -1),
          colors: [
            Color(0xffF093FB),
            Color(0xffFBC2EB),
            Color(0xffffffff),
          ],
          radius: .65,
          focal: Alignment(0.9, -1),
        ),
      ),
    );
  }
}
