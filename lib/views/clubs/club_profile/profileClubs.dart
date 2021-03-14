import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/profile_controller.dart';
import 'package:workflow/models/clubs.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';
import 'package:workflow/views/widgets/club_cards.dart';

class ProfileClubs extends StatelessWidget {
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth,
      color: bw(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Created ",
                    style: textStyleGilroyB(
                      18,
                      blue,
                    ),
                  ),
                  TextSpan(
                    text: "Clubs",
                    style: textStyleGilroyB(
                      18,
                      colorFont(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          GetX<ProfileController>(builder: (controller) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      controller.profileData.value.createdClubs[0] != null
                          ? MyClubCard(
                              createdClubInfo:
                                  controller.profileData.value.createdClubs[0],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            )
                          : CreateMyClubCard(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                      SizedBox(
                        width: 10,
                      ),
                      controller.profileData.value.createdClubs[1] != null
                          ? MyClubCard(
                              createdClubInfo:
                                  controller.profileData.value.createdClubs[1],
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            )
                          : CreateMyClubCard(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      controller.profileData.value.createdClubs[2] != null
                          ? MyClubCard(
                              createdClubInfo:
                                  controller.profileData.value.createdClubs[2],
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                              ),
                            )
                          : CreateMyClubCard(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                topLeft: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                              ),
                            ),
                      SizedBox(
                        width: 10,
                      ),
                      controller.profileData.value.createdClubs[3] != null
                          ? MyClubCard(
                              createdClubInfo:
                                  controller.profileData.value.createdClubs[3],
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            )
                          : CreateMyClubCard(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            );
          }),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Joined ",
                    style: textStyleGilroyB(
                      18,
                      blue,
                    ),
                  ),
                  TextSpan(
                    text: "Clubs",
                    style: textStyleGilroyB(
                      18,
                      colorFont(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: GetX<ProfileController>(
              builder: (controller) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      for (int i = 0;
                          i < controller.profileData.value.joinedClubs.length;
                          i++)
                        JoinedClubInfoCard(
                          joinedclubInfo:
                              controller.profileData.value.joinedClubs[i],
                        )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}
