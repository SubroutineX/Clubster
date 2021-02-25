import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/profile_image_controller.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/themeData.dart';

class ProfileImage extends StatelessWidget {
  final profileImageController = Get.put(ProfileImageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileImageController>(builder: (controller) {
      return Container(
        child: Stack(
          children: [
            Container(
              height: 104,
              width: 104,
              decoration: BoxDecoration(
                color: cardColor(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: controller.profileImage == null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/profile.jpg",
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            controller.profileImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () => controller.getProfileImage(),
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cardColor(),
                  ),
                  child: Center(
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: orange,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.edit,
                          color: white,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
