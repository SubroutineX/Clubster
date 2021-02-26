import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:workflow/controllers/club_controller.dart';

//PACKAGES
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:workflow/controllers/follows_controller.dart';
import 'package:workflow/controllers/join_club_controller.dart';

//PAGES
import 'package:workflow/views/clubs/club_details/club_detail_sheet.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';

//WIDGETS
import 'package:workflow/views/widgets/buttonBuilder.dart';

class ClubDetailsPage extends StatefulWidget {
  dynamic clubInfo;

  ClubDetailsPage({Key key, @required this.clubInfo});

  @override
  _ClubDetailsPageState createState() => _ClubDetailsPageState();
}

class _ClubDetailsPageState extends State<ClubDetailsPage> {
  String token;

  final cController = Get.find<ClubController>();
  final joinController = Get.put(JoinClub());

  void getStat() async {
    List value = await cController.fetchFollowingStat(
        widget.clubInfo.clubName, widget.clubInfo.id);
    setState(() {
      widget.clubInfo.joined = value[0];
      widget.clubInfo.following = value[1];
    });
  }

  @override
  void initState() {
    super.initState();

    getStat();
  }

  final followsController = Get.put(FollowsController());

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: Container(
        width: deviceDimensions.width,
        padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: fontColor.withOpacity(.1),
              offset: Offset(0, -3),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonBuilder(
              multiple: .55,
              height: 48,
              buttonText: "Join",
              color: violet,
              txtColor: white,
              splashColor: violetSplash,
              onTapCall: () {
                joinController.joinCLub(
                    widget.clubInfo.id, widget.clubInfo.status);
              },
            ),
            ButtonBuilder(
              multiple: .35,
              height: 48,
              buttonText:
                  widget.clubInfo.following ?? false ? "Following" : "Follow",
              color: widget.clubInfo.following ?? false ? white : blue,
              txtColor: widget.clubInfo.following ?? false ? blue : white,
              splashColor: blueSplash,
              onTapCall: () {
                if (!widget.clubInfo.following) {
                  followsController.follow(widget.clubInfo.clubName, "club");
                } else {
                  followsController.unfollow(widget.clubInfo.clubName, "club");
                }
                setState(
                  () {
                    widget.clubInfo.following = !widget.clubInfo.following;
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: deviceDimensions.width,
          height: deviceDimensions.height,
          child: SlidingSheet(
            cornerRadius: 30,
            scrollSpec: ScrollSpec.bouncingScroll(),
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.6, 1],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: deviceDimensions.width,
                    height: deviceDimensions.height * 0.45,
                    child: Hero(
                      tag: widget.clubInfo.id,
                      child: Image.network(
                        "http://65.1.43.39:8000/fetchClubImage?imageName=" +
                            widget.clubInfo.clubName +
                            ".jpg",
                        headers: {"Authorization": "Bearer $token"},
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: deviceDimensions.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Get.back(closeOverlays: true),
                          icon: Icon(
                            Icons.chevron_left,
                            color: white,
                            size: 35,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_none_outlined,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            builder: (context, state) {
              return ClubDetailSheet(clubInfo: widget.clubInfo);
            },
          ),
        ),
      ),
    );
  }
}
