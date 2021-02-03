import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:workflow/controllers/upload_page_controller.dart';
import 'package:workflow/models/file_model.dart';
import 'package:storage_path/storage_path.dart';
import 'package:workflow/views/clubs/page_navigator.dart';

class UStateful extends StatefulWidget {
  UStateful({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UStatefulState createState() => _UStatefulState();
}

class _UStatefulState extends State<UStateful> {
  Future<File> currentImage;

  List<AssetEntity> assets = [];

  @override
  void initState() {
    super.initState();
    _fetchAssets();
  }

  _fetchAssets() async {
    // Set onlyAll to true, to fetch only the 'Recent' album
    // which contains all the photos/videos in the storage
    final albums = await PhotoManager.getAssetPathList(hasAll: true);
    final recentAlbum = albums.first;

    // Now that we got the album, fetch all the assets it contains
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );

    // Update the state and notify UI
    setState(() => assets = recentAssets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: GetX<UploadImageController>(builder: (controller) {
                  return FutureBuilder(
                    future: currentImage,
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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // A grid view with 3 items per row
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: assets.length,
              itemBuilder: (_, index) {
                return buildAssetThumb(
                  assets[index],
                );
              },
            ),
          ),
        ],
      )),
    );
  }

  Future<File> getImage(Future<File> asset) {
    return asset;
  }

  buildAssetThumb(AssetEntity asset) {
    return FutureBuilder<Uint8List>(
      future: asset.thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        // If we have no data, display a spinner
        if (bytes == null) return CircularProgressIndicator();
        // If there's data, display it as an image
        return InkWell(
          onTap: () {
            setState(() {
              currentImage = asset.file;
            });
          },
          child: Stack(
            children: [
              // Wrap the image in a Positioned.fill to fill the space
              Positioned.fill(
                child: Image.memory(bytes, fit: BoxFit.cover),
              ),
              // Display a Play icon if the asset is a video
              if (asset.type == AssetType.video)
                Center(
                  child: Container(
                    color: Colors.blue,
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
