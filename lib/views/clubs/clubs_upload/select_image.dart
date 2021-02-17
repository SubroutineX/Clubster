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
import 'package:workflow/views/styles/themeData.dart';

class SelectImagePage extends StatelessWidget {
  final uploadController = Get.put(UploadImageController());

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bw(),
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        title: Text(
          "Post Image",
          style: textStyleSofiaL(
            18,
            colorFont(),
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
            color: colorFont(),
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
        cornerRadius: 20,
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
                        aspectRatio: 1.2,
                        maximumScale: 2,
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
            color: bw(),
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
                  style: textStyleSofiaB(
                    18,
                    colorFont(),
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
