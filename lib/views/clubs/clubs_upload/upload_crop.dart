import 'package:flutter/material.dart';
import 'dart:io';

class CropPage extends StatefulWidget {
  final File image;

  const CropPage({Key key, this.image}) : super(key: key);
  @override
  _CropPageState createState() => _CropPageState(image);
}

class _CropPageState extends State<CropPage> {
  final File image;
  _CropPageState(this.image);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: image != null ? Image.file(image) : Container(),
      ),
    );
  }
}
