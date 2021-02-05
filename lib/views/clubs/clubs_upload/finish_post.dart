import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/widgets/buttonBuilder.dart';
import 'package:workflow/views/widgets/postBuilder.dart';

class FinishPost extends StatelessWidget {
  final File file;

  const FinishPost({Key key, this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: GradientButtonBuilder(
          borderRadius: BorderRadius.circular(20),
          buttonText: "Post",
          colors: [
            Color(0xff7f00ff),
            Color(0xffe100ff),
          ],
        ),
      ),
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Text(
          "Post preview",
          style: textStyleL(
            18,
            fontColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_left,
            color: fontColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ImageUploadBuilder(
              postImg: file,
              profileImgUrl: "assets/images/profile.jpg",
              college: "D.Y.Patil",
              name: "Nikhil Shinde",
              postDay: "today",
            ),
          ],
        ),
      ),
    );
  }
}
