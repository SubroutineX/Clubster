import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart' as img;
import 'package:storage_path/storage_path.dart';
import 'package:workflow/models/file_model.dart';

class NewUpload extends StatefulWidget {
  NewUpload({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewUploadState createState() => _NewUploadState();
}

class _NewUploadState extends State<NewUpload> {
  List<FileModel> files;
  FileModel selectedModel;
  String image;
  List<File> imageNames;
  @override
  void initState() {
    super.initState();
    getImagesPath();
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

  compressFile(File file) {
    final filePath = file.absolute.path; // Create output file path
    // eg:- "Volume/VM/abcd_out.jpeg"
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.jp'));
    final splitted = filePath.substring(0, (lastIndex));
    final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
    var result = FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 5,
    );
    print(file.lengthSync());
    return result;
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
                      items: getItems(),
                      onChanged: (FileModel d) {
                        assert(d.files.length > 0);
                        image = d.files[0];
                        setState(() {
                          selectedModel = d;
                        });
                      },
                      value: selectedModel,
                    ))
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
                    ? Image.file(File(image),
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width)
                    : Container()),
            Divider(),
            selectedModel == null && selectedModel.files.length < 1
                ? Container()
                : Container(
                    height: MediaQuery.of(context).size.height * 0.38,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4),
                        itemBuilder: (_, i) {
                          var file = selectedModel.files[i];

                          // var imagec =
                          //     img.decodeImage(File(file).readAsBytesSync());

                          // // Resize the image to a 120x? thumbnail (maintaining the aspect ratio).
                          // img.Image thumbnail =
                          //     img.copyResize(imagec, width: 120);

                          // File newImg = File("name")
                          //   ..writeAsBytesSync(img.encodePng(thumbnail));

                          return GestureDetector(
                            child: Image.file(
                              compressFile(File(file)),
                              fit: BoxFit.contain,
                            ),
                            onTap: () {
                              setState(() {
                                image = file;
                              });
                            },
                          );
                        },
                        itemCount: selectedModel.files.length),
                  ),
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem> getItems() {
    return files
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
}
