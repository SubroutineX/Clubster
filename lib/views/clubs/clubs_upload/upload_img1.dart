import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:storage_path/storage_path.dart';
import 'package:workflow/models/file_model.dart';

class UploadImage extends StatefulWidget {
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  List<FileModel> data;
  FileModel selectedModel;
  File compressedFile;
  ScrollController controller;
  List<String> items = new List.generate(100, (index) => 'Hello $index');

  String image = "";
  @override
  void initState() {
    super.initState();
    getImagesPath();
    controller = new ScrollController()..addListener(_scrollListener);
    var file = File(image);
    compressFile(file);
  }

  List<DropdownMenuItem> getFolders() {
    return data
            .map((e) => DropdownMenuItem(
                  child: Text(
                    e.folder,
                    style: TextStyle(color: Colors.black),
                  ),
                  value: e,
                ))
            .toList() ??
        [];
  }

  Future<File> compressFile(File file) async {
    final filePath = file.absolute.path; // Create output file path
    // eg:- "Volume/VM/abcd_out.jpeg"
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    var newcompressedFile = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 1,
    );

    setState(() {
      compressedFile = newcompressedFile;
    });
    print(file.lengthSync());
    print(compressedFile.lengthSync());
    return compressedFile;
  }

  Future<void> getImagesPath() async {
    String imagespath = "";
    try {
      imagespath = await StoragePath.imagesPath;
      var response = jsonDecode(imagespath);
      var imageList = response as List;
      data =
          imageList.map<FileModel>((json) => FileModel.fromJson(json)).toList();
      print(data[1].folder);
      if (data != null && data.length > 0)
        setState(() {
          selectedModel = data[2];
          image = data[2].files[0];
          compressFile(File(image));
        });
    } on PlatformException {
      imagespath = 'Failed to get path';
    }
    return imagespath;
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 500) {
      setState(() {
        items.addAll(new List.generate(42, (index) => 'Inserted $index'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.clear),
                    SizedBox(width: 10),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<FileModel>(
                        items: getFolders(),
                        onChanged: (FileModel fileModel) {
                          setState(() {
                            selectedModel = fileModel;
                            image = fileModel.files[0];
                            var file = File(image);
                            compressFile(file);
                            print(File(image).lengthSync());
                          });
                        },
                        value: selectedModel,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ),
            Divider(),
            Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: image != null
                    ? Image.file(compressedFile,
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width)
                    : Container()),
            Divider(),
            selectedModel == null && selectedModel.files.length < 1
                ? Container()
                : Container(
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: GridView.builder(
                        controller: controller,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4),
                        itemBuilder: (_, i) {
                          var file = selectedModel.files[i];
                          return GestureDetector(
                            child: Image.file(
                              File(file),
                              fit: BoxFit.cover,
                            ),
                            onTap: () {
                              setState(() {
                                image = file;
                              });
                            },
                          );
                        },
                        itemCount: selectedModel.files.length),
                  )
          ],
        ),
      ),
    );
    // MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Plugin example app'),
    //     ),
    //     body: Column(
    //       children: [
    //         DropdownButton<FileModel>(
    //           items: getFolders(),
    //           onChanged: (FileModel fileModel) {
    //             setState(() {
    //               selectedModel = fileModel;
    //               image = fileModel.files[0];
    //               var file = File(image);
    //               compressFile(file);
    //               print(File(image).lengthSync());
    //             });
    //           },
    //           value: selectedModel,
    //         ),
    //         Divider(),
    //         Container(
    //             height: MediaQuery.of(context).size.height * 0.45,
    //             child: image != null
    //                 ? Image.file(compressedFile,
    //                     height: MediaQuery.of(context).size.height * 0.45,
    //                     width: MediaQuery.of(context).size.width)
    //                 : Container()),
    //         Divider(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
