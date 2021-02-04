import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadImageController extends GetxController {
  Future<File> currentImage;

  List<AssetEntity> selectedAssets = [];
  List<AssetPathEntity> albums = [];
  AssetPathEntity selectedAlbum;

  @override
  void onInit() {
    super.onInit();
    fetchAlbumswithImages();
  }

  Future<File> selectCurrentImage(Future<File> asset) {
    currentImage = getThumbnailFile(asset);
    update(["mainImg"]);
  }

  Future<File> getThumbnailFile(Future<File> asset) async {
    final file = await asset;
    File compressedFile = await FlutterNativeImage.compressImage(
      file.path,
      quality: 50,
    );
    return compressedFile;
  }

  Future<Widget> fetchAlbumswithImages() async {
    try {
      final fetchedAlbums = await PhotoManager.getAssetPathList();
      albums = fetchedAlbums;
      print(fetchedAlbums[2].name);

      selectedAlbum = albums[0];
      selectedAssets =
          await selectedAlbum.getAssetListRange(start: 0, end: 10000);
      selectCurrentImage(selectedAssets[0].file);
      print(selectedAssets[0]);
      Widget gridView = await GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: selectedAssets.length,
        itemBuilder: (_, index) {
          return buildAssetThumb(
            selectedAssets[index],
          );
        },
      );
      return gridView;
    } catch (err) {
      print(err);
    }
  }

  buildAssetThumb(AssetEntity asset) {
    return FutureBuilder<Uint8List>(
      future: asset.thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null) return CircularProgressIndicator();
        return InkWell(
          onTap: () {
            selectCurrentImage(asset.file);
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.memory(bytes, fit: BoxFit.cover),
              ),
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
