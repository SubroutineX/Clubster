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
    fetchAlbums();
    fetchAlbumImages();
    selectCurrentImage(selectedAssets[0].file);
  }

  Future<File> selectCurrentImage(Future<File> asset) {
    Future<File> img = currentImage;
    currentImage = getThumbnailFile(asset);
    if (img != currentImage) {
      update(["mainImg"]);
    }
  }

  Future<File> getThumbnailFile(Future<File> asset) async {
    final file = await asset;
    File compressedFile = await FlutterNativeImage.compressImage(
      file.path,
      quality: 50,
    );
    return compressedFile;
  }

  void fetchAlbums() async {
    try {
      final fetchedAlbums = await PhotoManager.getAssetPathList();
      albums = fetchedAlbums;
      print(fetchedAlbums[2].name);
    } catch (err) {
      print(err);
    }
  }

  void fetchAlbumImages() async {
    try {
      selectedAlbum = albums[0];
      selectedAssets = await selectedAlbum.getAssetListRange(start: 0, end: 10);
      print(selectedAssets[0]);
    } catch (error) {
      print(error);
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
