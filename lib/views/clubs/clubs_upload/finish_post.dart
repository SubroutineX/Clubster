import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/create_post_controller.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';
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
      backgroundColor: bw(),
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        title: Text(
          "Post preview",
          style: textStyleSofiaL(
            18,
            colorFont(),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.chevron_left,
            color: colorFont(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                              style: textStyleSofiaSB(15, colorFont()),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "D.Y.Patil",
                              style: textStyleSofiaL(12, colorFont()),
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
                              style: textStyleSofiaL(12, colorFont()),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.more_vert,
                              color: colorFont(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: AspectRatio(
                    aspectRatio: 1.2,
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
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: bw(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    style: textStyleGilroyM(
                      18,
                      colorFont(),
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add caption...",
                      hintStyle: textStyleSofiaR(
                        16,
                        colorFontLight(),
                      ),
                    ),
                    controller: captionController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Divider(
                    thickness: 1,
                    color: dividerColor(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
