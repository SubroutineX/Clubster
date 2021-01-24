import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:workflow/controllers/club_image_controller.dart';
import 'package:workflow/controllers/create_club_controller.dart';
import 'package:workflow/controllers/status_selector_controller.dart';

//PACKAGES
import 'package:sliding_sheet/sliding_sheet.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class CreateClub extends StatelessWidget {
  final clubImageController = Get.put(ClubImageController());
  final statusSelector = Get.put(StatusSelector());
  final createClubController = Get.put(CreateClubController());

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Container(
      height: deviceDimensions.height,
      width: deviceDimensions.width,
      child: SlidingSheet(
        cornerRadius: 30,
        scrollSpec: ScrollSpec.overscroll(),
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.65, 1],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder(
                  init: ClubImageController(),
                  builder: (_controller) {
                    return GestureDetector(
                      onTap: () {
                        _controller.getImage();
                      },
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        child: null != _controller.imageClub
                            ? Image.file(
                                _controller.imageClub,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                color: clubsBackground2.withOpacity(.8),
                                constraints: BoxConstraints.expand(),
                                child: Center(
                                  child: Icon(
                                    Icons.add_a_photo_rounded,
                                  ),
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 10,
              decoration: BoxDecoration(
                color: clubsBackground,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
          ],
        ),
        builder: (context, state) {
          return Container(
            color: clubsBackground,
            padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create a Club",
                  style: appBarHead,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "connect with people and explore clubs",
                  style: questionStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Name",
                  style: labelStyle,
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                      style: formFieldStyle,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Club Name",
                        hintStyle: hintStyle,
                      ),
                      onChanged: (value) {
                        createClubController.getName(value);
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Genre",
                  style: labelStyle,
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextFormField(
                    style: formFieldStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Genre",
                      hintStyle: hintStyle,
                    ),
                    onChanged: (value) {
                      createClubController.getGenre(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Members",
                            style: labelStyle,
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              style: formFieldStyle,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Member limit",
                                hintStyle: hintStyle,
                              ),
                              onChanged: (value) {
                                createClubController.getLimit(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Status",
                            style: labelStyle,
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: GetBuilder(
                              init: StatusSelector(),
                              builder: (_controller) {
                                return DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  value: _controller.value,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("Open"),
                                      value: 'open',
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Invite only"),
                                      value: 'invite_only',
                                    ),
                                  ],
                                  onChanged: (value) {
                                    _controller.changeStatus(value);
                                    createClubController.getStatus(value);
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Description",
                  style: labelStyle,
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
                    keyboardType: TextInputType.multiline,
                    maxLength: 200,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Description here",
                      hintStyle: hintStyle,
                    ),
                    onChanged: (value) {
                      createClubController.getdescription(value);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  shape: StadiumBorder(),
                  color: violet,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      createClubController
                          .createClub(clubImageController.imageClub);
                    },
                    focusColor: violetSplash,
                    highlightColor: violetSplash,
                    splashColor: violetSplash,
                    hoverColor: violetSplash,
                    child: Container(
                      height: 48,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          "Create",
                          style: joinStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
