import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:image_picker/image_picker.dart';

class CropPage extends StatefulWidget {
  final File file;

  const CropPage({Key key, this.file}) : super(key: key);

  @override
  CropPageState createState() => new CropPageState(file);
}

class CropPageState extends State<CropPage> {
  final cropKey = GlobalKey<CropState>();

  final File file;

  CropPageState(this.file);

  @override
  void dispose() {
    super.dispose();
    widget.file?.delete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(child: _buildCropimg()),
      ),
    );
  }

  Widget _buildCropimg() {
    return Container(
      color: Colors.black,
      child: Crop(
        key: cropKey,
        image: FileImage(file),
        aspectRatio: 4 / 3,
      ),
    );
  }
}
