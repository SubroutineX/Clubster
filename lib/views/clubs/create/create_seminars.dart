import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:workflow/controllers/club_image_controller.dart';

//PACKAGES
import 'package:sliding_sheet/sliding_sheet.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class CreateSeminar extends StatefulWidget {
  @override
  _CreateSeminarState createState() => _CreateSeminarState();
}

class _CreateSeminarState extends State<CreateSeminar> {
  DateTime selectedDate = DateTime.now();

  TextEditingController _date = new TextEditingController();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        var date = DateTime.parse(picked.toString());
        String formatDate = "${date.day}/${date.month}/${date.year}";
        _date.value = TextEditingValue(text: formatDate);
      });
    }
  }

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
                        child: null != _controller.imageSeminar
                            ? Image.file(
                                _controller.imageSeminar,
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
                  "Host Seminar",
                  style: appBarHead,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Create Workshop to educate the your fellow friend's",
                  style: questionStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Seminar Title",
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
                      hintText: "Seminar Title",
                      hintStyle: hintStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Host",
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
                      hintText: "Host",
                      hintStyle: hintStyle,
                    ),
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
                            "Date",
                            style: labelStyle,
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: GestureDetector(
                              onTap: () => _selectDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  style: formFieldStyle,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Select date",
                                    hintStyle: hintStyle,
                                  ),
                                ),
                              ),
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
                            "Member limit",
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
                                hintText: "Enter member limit",
                                hintStyle: hintStyle,
                              ),
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
