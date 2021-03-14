import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/club_members_controller.dart';
import 'package:workflow/controllers/club_requests_controller.dart';
import 'package:workflow/controllers/profile_controller.dart';
import 'package:workflow/models/club_members_model.dart';
import 'package:workflow/views/styles/themeData.dart';
import 'package:workflow/views/widgets/clubMemberCard.dart';

class ClubMemberList extends StatefulWidget {
  final String clubId;

  const ClubMemberList({Key key, this.clubId}) : super(key: key);
  @override
  _ClubMemberListState createState() => _ClubMemberListState();
}

class _ClubMemberListState extends State<ClubMemberList> {
  final clubMembersController = Get.put(ClubMembersController());

  @override
  void initState() {
    super.initState();
    clubMembersController.fetchClubMembers(widget.clubId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bw(),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: GetX<ClubMembersController>(builder: (controller) {
          return ListView.builder(
            itemCount: controller.clubMembers.length,
            itemBuilder: (context, i) {
              return ClubMemberCard2(
                index: i + 1,
                clubMember: clubMembersController.clubMembers[i],
              );
            },
          );
        }),
      ),
    );
  }
}
