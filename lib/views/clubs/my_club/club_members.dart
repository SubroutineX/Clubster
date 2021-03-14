import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/club_requests_controller.dart';
import 'package:workflow/controllers/profile_controller.dart';
import 'package:workflow/views/styles/themeData.dart';
import 'package:workflow/views/widgets/clubMemberCard.dart';

class ClubMembers extends StatelessWidget {
  final members = <ClubMembers>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: cardColor(),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: ListView.builder(
          itemCount: members.length,
          itemBuilder: (context, i) {
            return ClubMemberCard();
          },
        ),
      ),
    );
  }
}
