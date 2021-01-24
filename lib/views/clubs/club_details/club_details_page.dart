import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:workflow/controllers/club_controller.dart';

//PACKAGES
import 'package:sliding_sheet/sliding_sheet.dart';

//PAGES
import 'package:workflow/views/clubs/club_details/club_detail_sheet.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';

//WIDGETS
import 'package:workflow/views/widgets/buttonBuilder.dart';

class ClubDetailsPage extends StatelessWidget {
  dynamic clubInfoPage;
  String token;
  final cController = Get.find<ClubController>();

  ClubDetailsPage({Key key, @required this.clubInfoPage});

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
              splashColor: violetSplash,
              onTapCall: () {
                print("join");
              },
            ),
            ButtonBuilder(
              multiple: .35,
              height: 48,
              buttonText: "Follow",
              color: blue,
              splashColor: blueSplash,
              onTapCall: () {
                print("follow");
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
                      tag: clubInfoPage.id,
                      child: Image.network(
                        "http://192.168.43.152:8000/fetchClubImage?imageName=" +
                            clubInfoPage.clubName +
                            ".jpg",
                        headers: {"Authorization": "Bearer $token"},
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
              return ClubDetailSheet(page: clubInfoPage);
            },
          ),
        ),
      ),
    );
  }
}
