import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:image_crop/image_crop.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadImageController extends GetxController {
  Future<File> currentImage;
  List<AssetEntity> selectedImages = [];
  List<AssetPathEntity> albums = [];
  AssetPathEntity selectedAlbum;

  final cropKey = GlobalKey<CropState>();

  @override
  void onInit() {
    super.onInit();
    fetchAlbumswithImages();
  }

  setCurrentImage(Future<File> asset) {
    currentImage = asset;
    update(["mainImg"]);
  }

  Future<File> getCompressedFile(Future<File> asset) async {
    final file = await asset;
    // print(file.path);
    File compressedFile = await FlutterNativeImage.compressImage(
      file.path,
      quality: 75,
    );
    return compressedFile;
  }

  fetchAlbumswithImages() async {
    try {
      final fetchedAlbums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );
      albums = fetchedAlbums;
      // print(fetchedAlbums[2].name);

      selectedAlbum = albums[0];
      selectedImages =
          await selectedAlbum.getAssetListRange(start: 0, end: 10000);
      if (currentImage == null) {
        setCurrentImage(selectedImages[0].file);
      }
      // print(selectedAssets[0]);
      Widget gridView = await GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: selectedImages.length,
        itemBuilder: (_, index) {
          return buildImageThumbnail(
            selectedImages[index],
          );
        },
      );
      return gridView;
    } catch (err) {
      // print(err);
    }
  }

  buildImageThumbnail(AssetEntity asset) {
    return FutureBuilder<Uint8List>(
      future: asset.thumbDataWithSize(
        256,
        256,
        quality: 100,
      ),
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null)
          return Container(child: Center(child: CircularProgressIndicator()));
        return InkWell(
          onTap: () {
            setCurrentImage(getCompressedFile(asset.originFile));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.memory(bytes, fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }

  Future<File> cropImage(File selectedFile) async {
    final scale = cropKey.currentState.scale;
    final area = cropKey.currentState.area;

    final sample = await ImageCrop.sampleImage(
      file: selectedFile,
      preferredSize: (3000 / scale).round(),
    );

    final file = await ImageCrop.cropImage(
      file: sample,
      area: area,
    );

    sample.delete();
    // debugPrint('$file');

    return file;
  }
}
