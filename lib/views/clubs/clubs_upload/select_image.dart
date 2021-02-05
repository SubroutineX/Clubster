import 'package:flutter/material.dart';
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
            Get.back();
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
                    File image = await controller.currentImage;
                    File croppedImage = await controller.cropImage(image);
                    Get.to(
                      FinishPost(
                        file: croppedImage,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        "Next",
                        style: textStyleR(
                          18,
                          violet,
                        ),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: violet,
                      ),
                    ],
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
                        maximumScale: 1.5,
                        key: controller.cropKey,
                        aspectRatio: 1,
                        image: FileImage(
                          snapshot.data,
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              );
            },
          ),
        ),
        builder: (context, state) {
          return Container(
            height: deviceDimensions.height * .50,
            color: white,
            padding: EdgeInsets.only(
              top: 20,
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
                  height: 20,
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
