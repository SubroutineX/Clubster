import 'package:flutter/material.dart';

//GETX CONTROLLERS
import 'package:workflow/models/clubs.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/widgets/buttonBuilder.dart';

//WIDGETS
import 'package:workflow/views/widgets/club_card_vertical.dart';

class CreateProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceDimension = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: deviceDimension.height,
      color: clubsBackground,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AspectRatio(
                aspectRatio: 1.7,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: black.withOpacity(.05),
                        blurRadius: 20,
                        offset: Offset(0, 7),
                        spreadRadius: -5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: red,
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Nikhil Shinde",
                                            style: textStyleSB(
                                              22,
                                              fontColor,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Student",
                                            style: textStyleR(
                                              16,
                                              fontColorLight,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButtonBuilder(
                                        icon: Icons.edit_rounded,
                                        buttonText: "Edit",
                                        height: 30,
                                        width: 70,
                                        borderRadius: BorderRadius.circular(10),
                                        color: blue,
                                        splashColor: blueSplash,
                                        textStyle: textStyleR(14, white),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AspectRatio(
                          aspectRatio: 4.15,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffebedf2),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(.05),
                                  blurRadius: 20,
                                  offset: Offset(0, 7),
                                  spreadRadius: -5,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Clubs following",
                                        style: textStyleSB(13, fontColorLight),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "4",
                                        textAlign: TextAlign.center,
                                        style: textStyleSB(22, fontColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Clubs Created",
                                        style: textStyleSB(13, fontColorLight),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "1",
                                        textAlign: TextAlign.center,
                                        style: textStyleSB(22, fontColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Club Posts",
                                        style: textStyleSB(13, fontColorLight),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "38",
                                        textAlign: TextAlign.center,
                                        style: textStyleSB(22, fontColor),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
