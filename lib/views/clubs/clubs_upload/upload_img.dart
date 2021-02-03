import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:workflow/models/file_model.dart';
import 'package:storage_path/storage_path.dart';
import 'package:workflow/views/clubs/page_navigator.dart';

class UploadImagex extends StatefulWidget {
  UploadImagex({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UploadImagexState createState() => _UploadImagexState();
}

class _UploadImagexState extends State<UploadImagex> {
  List<FileModel> files;
  FileModel selectedModel;
  String image;
  File compressedFile;

  List<AssetEntity> assets = [];

  var file;

  @override
  void initState() {
    super.initState();
    getImagesPath();
    _fetchAssets();
  }

  getAlbums() async {
    final albums = await PhotoManager.getAssetPathList();
  }

  _fetchAssets() async {
    // Set onlyAll to true, to fetch only the 'Recent' album
    // which contains all the photos/videos in the storage
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    final recentAlbum = albums.first;

    // Now that we got the album, fetch all the assets it contains
    final recentAssets = await recentAlbum.getAssetListRange(
      start: 0, // start at index 0
      end: 1000000, // end at a very big index (to get all the assets)
    );

    // Update the state and notify UI
    setState(() => assets = recentAssets);
  }

  getImagesPath() async {
    var imagePath = await StoragePath.imagesPath;

    var images = jsonDecode(imagePath) as List;
    files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
    if (files != null && files.length > 0)
      setState(() {
        selectedModel = files[0];
        image = files[0].files[0];
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            // A grid view with 3 items per row
            crossAxisCount: 3,
          ),
          itemCount: assets.length,
          itemBuilder: (_, index) {
            return AssetThumbnail(asset: assets[index]);
          },
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Column(
  //         children: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: <Widget>[
  //               Row(
  //                 children: <Widget>[
  //                   IconButton(
  //                     icon: Icon(Icons.clear),
  //                     onPressed: () => {
  //                       Get.to(PageNavigator()),
  //                     },
  //                   ),
  //                   SizedBox(width: 10),
  //                   DropdownButtonHideUnderline(
  //                       child: DropdownButton<FileModel>(
  //                     items: getItems(),
  //                     onChanged: (FileModel d) {
  //                       assert(d.files.length > 0);
  //                       image = d.files[0];
  //                       setState(() {
  //                         selectedModel = d;
  //                       });
  //                     },
  //                     value: selectedModel,
  //                   ))
  //                 ],
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Text(
  //                   'Next',
  //                   style: TextStyle(color: Colors.blue),
  //                 ),
  //               )
  //             ],
  //           ),
  //           Divider(),
  //           FutureBuilder<Object>(
  //               future: getThumbnailFile(File(image)),
  //               builder: (context, snapshot) {
  //                 if (snapshot.hasData) {
  //                   return Container(
  //                       height: MediaQuery.of(context).size.height * 0.45,
  //                       child: Image.file(snapshot.data,
  //                           height: MediaQuery.of(context).size.height * 0.45,
  //                           width: MediaQuery.of(context).size.width));
  //                 } else {
  //                   return CircularProgressIndicator();
  //                 }
  //               }),
  //           Divider(),
  //           selectedModel == null && selectedModel.files.length < 1
  //               ? Container()
  //               : Container(
  //                   height: MediaQuery.of(context).size.height * 0.38,
  //                   child: GridView.builder(
  //                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                           crossAxisCount: 4,
  //                           crossAxisSpacing: 4,
  //                           mainAxisSpacing: 4),
  //                       itemBuilder: (_, i) {
  //                         var file = selectedModel.files[i];
  //                         return FutureBuilder(
  //                             future: getThumbnailFile(File(file)),
  //                             builder: (BuildContext context, snapshot) {
  //                               if (snapshot.hasData) {
  //                                 // var imagec = img.decodeImage(
  //                                 //     snapshot.data.readAsBytesSync());
  //                                 // img.Image image = img.decodeJpg(tmpFile.readAsBytesSync());

  //                                 // // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
  //                                 // img.Image thumbnail =
  //                                 //     img.copyResize(imagec, width: 60);
  //                                 // //  img.Image thumbnail = img.decodeJpg(File(file).readAsBytesSync());
  //                                 // var byte =
  //                                 //     imageToByteListUint8(thumbnail, 60);
  //                                 // return GestureDetector(
  //                                 //   child: Image.memory(
  //                                 //     byte,
  //                                 //     fit: BoxFit.cover,
  //                                 //   ),
  //                                 //   onTap: () {
  //                                 //     setState(() {
  //                                 //       image = file;
  //                                 //     });
  //                                 //   },
  //                                 // );

  //                                 return GestureDetector(
  //                                   child: Image.file(
  //                                     snapshot.data,
  //                                     fit: BoxFit.cover,
  //                                   ),
  //                                   onTap: () {
  //                                     setState(() {
  //                                       image = file;
  //                                     });
  //                                   },
  //                                 );
  //                               } else {
  //                                 return Container(
  //                                     child: Center(
  //                                         child: CircularProgressIndicator()));
  //                               }
  //                             });
  //                       },
  //                       itemCount: selectedModel.files.length),
  //                 )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Uint8List imageToByteListUint8(img.Image image, int inputSize) {
  //   var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
  //   var buffer = Uint8List.view(convertedBytes.buffer);
  //   int pixelIndex = 0;
  //   for (var i = 0; i < inputSize; i++) {
  //     for (var j = 0; j < inputSize; j++) {
  //       var pixel = image.getPixel(j, i);
  //       buffer[pixelIndex++] = img.getRed(pixel);
  //       buffer[pixelIndex++] = img.getGreen(pixel);
  //       buffer[pixelIndex++] = img.getBlue(pixel);
  //     }
  //   }
  //   return convertedBytes.buffer.asUint8List();
  // }

  // Future<File> getThumbnailFile(File file) async {
  //   File compressedFile = await FlutterNativeImage.compressImage(
  //     file.path,
  //     quality: 1,
  //   );
  //   return compressedFile;
  // }

  // List<DropdownMenuItem> getItems() {
  //   return files
  //           .map((e) => DropdownMenuItem(
  //                 child: Text(
  //                   e.folder,
  //                   style: TextStyle(color: Colors.black),
  //                 ),
  //                 value: e,
  //               ))
  //           .toList() ??
  //       [];
  // }
}

class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({
    Key key,
    @required this.asset,
  }) : super(key: key);

  final AssetEntity asset;

  @override
  Widget build(BuildContext context) {
    // We're using a FutureBuilder since thumbData is a future
    return FutureBuilder<Uint8List>(
      future: asset.thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        // If we have no data, display a spinner
        if (bytes == null) return CircularProgressIndicator();
        // If there's data, display it as an image
        return InkWell(
          onTap: () {},
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
