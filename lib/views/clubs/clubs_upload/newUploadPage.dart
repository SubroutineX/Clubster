import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:workflow/controllers/upload_page_controller.dart';
import 'package:workflow/views/styles/colors.dart';

class UploadNew extends StatelessWidget {
  final uploadController = Get.put(UploadImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: GetBuilder<UploadImageController>(
                    id: "mainImg",
                    builder: (controller) {
                      return FutureBuilder(
                        future: controller.currentImage,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Image.file(
                              snapshot.data,
                              fit: BoxFit.contain,
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      );
                    }),
              ),
            ),
          ),
          Container(
            height: 300,
            child: GetBuilder<UploadImageController>(builder: (controller) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // A grid view with 3 items per row
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemCount: controller.selectedAssets.length,
                itemBuilder: (_, index) {
                  return controller.buildAssetThumb(
                    controller.selectedAssets[index],
                  );
                },
              );
            }),
          ),
        ],
      )),
    );
  }
}
