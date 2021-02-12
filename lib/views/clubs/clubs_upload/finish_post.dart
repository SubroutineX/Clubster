import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/create_post_controller.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/widgets/buttonBuilder.dart';
import 'package:workflow/views/widgets/postBuilder.dart';

class FinishPost extends StatelessWidget {
  final File file;
  final CreatePostController controller = Get.put(CreatePostController());

  FinishPost({Key key, this.file}) : super(key: key);

  TextEditingController captionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: GradientButtonBuilder(
          onTap: () {
            controller.createPost(file, captionController.text);
          },
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
          style: textStyleSofiaL(
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
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/profile.jpg",
                          ),
                          backgroundColor: transparent,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nikhil",
                                style: textStyleSofiaSB(15, fontColor),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "D.Y.Patil",
                                style: textStyleSofiaL(12, fontColor),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "today",
                                style: textStyleSofiaL(12, fontColor),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.more_vert,
                                color: fontColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          file,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      style: formFieldStyle,
                      maxLines: null,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add caption...",
                        hintStyle: textStyleSofiaR(
                          16,
                          fontColorLight,
                        ),
                      ),
                      controller: captionController,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: fontColorLight.withOpacity(.05),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
