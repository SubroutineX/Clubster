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
                aspectRatio: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20,
                  ),
                  height: 170,
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
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
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
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Nikhil Shinde",
                                          style: textStyleSB(
                                            19,
                                            fontColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Student",
                                          style: textStyleR(
                                            15,
                                            fontColorLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              ButtonBuilder(
                                buttonText: "Follow",
                                color: violet,
                                splashColor: violetSplash,
                                height: 40,
                                width: double.infinity,
                                textStyle: textStyleR(16, white),
                                borderRadius: BorderRadius.circular(5),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
