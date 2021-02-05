import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:image_crop/image_crop.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadImageController extends GetxController {
  Future<File> currentImage;
  List<AssetEntity> selectedAssets = [];
  List<AssetPathEntity> albums = [];
  AssetPathEntity selectedAlbum;

  final cropKey = GlobalKey<CropState>();

  @override
  void onInit() {
    super.onInit();
    fetchAlbumswithImages();
  }

  Future<File> selectCurrentImage(Future<File> asset) {
    currentImage = asset;
    update(["mainImg"]);
  }

  // Future<File> getThumbnailFile(Future<File> asset) async {
  //   final file = await asset;
  //   File compressedFile = await FlutterNativeImage.compressImage(
  //     file.path,
  //     quality: 50,
  //   );
  //   return compressedFile;
  // }

  Future<Widget> fetchAlbumswithImages() async {
    try {
      final fetchedAlbums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );
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
    Future<File> originalImage = asset.originFile;
    return FutureBuilder<Uint8List>(
      future: asset.thumbDataWithSize(
        256,
        256,
        quality: 100,
      ),
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null) return CircularProgressIndicator();
        return InkWell(
          onTap: () {
            selectCurrentImage(
              originalImage,
            );
          },
          child: Container(
            child: Image.memory(bytes, fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  Future<File> cropImage(File inputFile) async {
    final scale = cropKey.currentState.scale;
    final area = cropKey.currentState.area;

    final sample = await ImageCrop.sampleImage(
      file: inputFile,
      preferredSize: (3000 / scale).round(),
    );

    final file = await ImageCrop.cropImage(
      file: sample,
      area: area,
    );

    sample.delete();

    debugPrint('$file');
    return file;
  }
}
