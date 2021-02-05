import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workflow/views/clubs/clubs_feed/imageDisplay.dart';
import 'package:workflow/views/clubs/clubs_upload/select_image.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/icons.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/widgets/postBuilder.dart';
import 'package:workflow/views/widgets/storyBuilder.dart';

class Timeline extends StatelessWidget {
  PermissionStatus _permissionStatus;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                UploadBuilder(
                  onTapCall: () async {
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
                        dismissDirection: SnackDismissDirection.HORIZONTAL,
                        barBlur: 50,
                        icon: Icon(
                          FontAwesomeIcons.exclamationCircle,
                          color: yellow,
                        ),
                      );
                    } else if (_permissionStatus.isPermanentlyDenied) {
                      Get.snackbar(
                        "Permission Denied Permanently",
                        "Please give storage permissions from your system settings",
                        borderColor: yellow,
                        borderWidth: .5,
                        isDismissible: true,
                        dismissDirection: SnackDismissDirection.HORIZONTAL,
                        barBlur: 50,
                        icon: Icon(
                          FontAwesomeIcons.exclamationCircle,
                          color: yellow,
                        ),
                      );
                    }
                  },
                  storyName: "Upload",
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
          SizedBox(
            height: 30,
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
