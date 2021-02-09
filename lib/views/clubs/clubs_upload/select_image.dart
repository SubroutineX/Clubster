import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_crop/image_crop.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:workflow/controllers/upload_image_controller.dart';
import 'package:workflow/views/clubs/clubs_upload/finish_post.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class SelectImagePage extends StatelessWidget {
  final uploadController = Get.put(UploadImageController());

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Post Image",
          style: textStyleL(
            18,
            fontColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            Get.back();
            Get.find<UploadImageController>().currentImage = null;
          },
          icon: Icon(
            Icons.chevron_left,
            color: fontColor,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Center(
              child: GetBuilder<UploadImageController>(builder: (controller) {
                return GestureDetector(
                  onTap: () async {
                    HapticFeedback.lightImpact();
                    File image = await controller.currentImage;
                    File croppedImage = await controller.cropImage(image);
                    Get.to(
                      FinishPost(
                        file: croppedImage,
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 12,
                      top: 8,
                      bottom: 8,
                      right: 8,
                    ),
                    decoration: BoxDecoration(
                      color: neonBlue,
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Next"),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 15,
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
      body: SlidingSheet(
        scrollSpec: ScrollSpec.overscroll(),
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.35, 1],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Container(
          height: deviceDimensions.height * 0.60,
          width: double.infinity,
          child: GetBuilder<UploadImageController>(
            id: "mainImg",
            init: UploadImageController(),
            builder: (controller) {
              return FutureBuilder(
                future: controller.currentImage,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(
                      child: Crop(
                        maximumScale: 3,
                        key: controller.cropKey,
                        image: FileImage(
                          snapshot.data,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ),
        builder: (context, state) {
          return Container(
            height: deviceDimensions.height * .65,
            color: white,
            padding: EdgeInsets.only(
              top: 25,
              left: 10,
              right: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Browse images",
                  style: textStyleB(
                    18,
                    fontColor,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: GetBuilder<UploadImageController>(
                    builder: (controller) {
                      return FutureBuilder(
                        future: controller.fetchAlbumswithImages(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return snapshot.data;
                          } else {
                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
