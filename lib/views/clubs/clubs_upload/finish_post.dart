import 'dart:io';
import 'package:flutter/material.dart';

class FinishPost extends StatelessWidget {
  final File file;

  const FinishPost({Key key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Center(
          child: Image.file(file),
        ),
      ),
    );
  }
}
