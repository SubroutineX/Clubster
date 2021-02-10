import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workflow/controllers/auth_controller.dart';
import 'package:workflow/views/clubs/clubs_upload/select_image.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/icons.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/widgets/postBuilder.dart';
import 'package:workflow/views/widgets/storyBuilder.dart';

class Feed extends StatelessWidget {
  PermissionStatus _permissionStatus;

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(1, -1),
          colors: [
            lightred,
            Color(0xffffffff),
          ],
          radius: .80,
          focal: Alignment(0.9, -1),
        ),
      ),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: transparent,
            leading: IconButton(
              onPressed: () {
                print("svg");
                HapticFeedback.lightImpact();
              },
              icon: SvgPicture.asset(
                menuIcon,
                color: fontColor,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              "Clubster",
              style: textStyleL(18, fontColor),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                tooltip: "Logout",
                icon: Icon(
                  Icons.login_outlined,
                  color: fontColor,
                ),
                onPressed: () {
                  authController.logoutUser();
                },
              ),
            ],
            expandedHeight: 175,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.blurBackground,
              ],
              background: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          UploadBuilder(
                            onTapCall: () async {
                              HapticFeedback.lightImpact();

                              _permissionStatus = await getPermissions();
                              if (_permissionStatus.isGranted) {
                                Get.to(
                                  SelectImagePage(),
                                );
                              } else if (_permissionStatus.isDenied) {
                                Get.snackbar(
                                  "Permission Denied",
                                  "Cannot access images !",
                                  borderColor: yellow,
                                  borderWidth: .5,
                                  isDismissible: true,
                                  dismissDirection:
                                      SnackDismissDirection.HORIZONTAL,
                                  barBlur: 50,
                                  icon: Icon(
                                    FontAwesomeIcons.exclamationCircle,
                                    color: yellow,
                                  ),
                                );
                              } else if (_permissionStatus
                                  .isPermanentlyDenied) {
                                Get.snackbar(
                                  "Permission Denied Permanently",
                                  "Please give storage permissions from your system settings",
                                  borderColor: yellow,
                                  borderWidth: .5,
                                  isDismissible: true,
                                  dismissDirection:
                                      SnackDismissDirection.HORIZONTAL,
                                  barBlur: 50,
                                  icon: Icon(
                                    FontAwesomeIcons.exclamationCircle,
                                    color: yellow,
                                  ),
                                );
                              }
                            },
                            storyName: "",
                            localUrl: "assets/images/profile.jpg",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StoryBuilder(
                            seen: false,
                            storyName: "Python",
                            localUrl: "assets/images/python.jpg",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StoryBuilder(
                            seen: false,
                            storyName: "Dance workshop",
                            localUrl: "assets/images/dance.jpg",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StoryBuilder(
                            seen: false,
                            storyName: "TATA motors",
                            localUrl: "assets/images/tata.jpg",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StoryBuilder(
                            seen: true,
                            storyName: "HTML/CSS",
                            localUrl: "assets/images/css.jpg",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StoryBuilder(
                            seen: true,
                            storyName: "Guest Lecture",
                            localUrl: "assets/images/guest.jpg",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          StoryBuilder(
                            seen: true,
                            storyName: "Sing along",
                            localUrl: "assets/images/sing.jpg",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                PostCard(
                  profileImgUrl: "assets/images/cricket.jpg",
                  postImgUrl: "assets/images/dance.jpg",
                  name: "Nikhil Shinde",
                  college: "D.Y.Patil",
                  postDay: "today",
                  likes: 50,
                  comments: 43,
                ),
                SizedBox(
                  height: 30,
                ),
                PostCard(
                  profileImgUrl: "assets/images/inventors.jpg",
                  postImgUrl: "assets/images/dancers.jpg",
                  name: "Atharva Kulkarni",
                  college: "R.S.C.O.E",
                  postDay: "1d",
                  likes: 50,
                  comments: 43,
                ),
                SizedBox(
                  height: 30,
                ),
                PostCard(
                  profileImgUrl: "assets/images/inventors.jpg",
                  postImgUrl: "assets/images/redline.jpg",
                  name: "Atharva Kulkarni",
                  college: "R.S.C.O.E",
                  postDay: "1d",
                  likes: 50,
                  comments: 43,
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<PermissionStatus> getPermissions() async {
    PermissionStatus status = PermissionStatus.undetermined;
    if (status.isUndetermined) {
      status = await Permission.storage.request();
    }
    return status;
  }
}
