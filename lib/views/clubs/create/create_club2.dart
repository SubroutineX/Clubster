import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:workflow/views/clubs/club_view/pageview.dart';
import 'package:workflow/views/clubs/create/create_club.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class CreateClub2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Explore ",
                      style: textStyleGilroyB(
                        25,
                        blue,
                      ),
                    ),
                    TextSpan(
                      text: "Possibilities",
                      style: textStyleGilroyB(
                        18,
                        colorFont(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "by ",
                      style: textStyleGilroyB(
                        18,
                        colorFont(),
                      ),
                    ),
                    TextSpan(
                      text: "Creating",
                      style: textStyleGilroyB(
                        25,
                        blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              child: AspectRatio(
                aspectRatio: 4 / 5,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 2 / 5,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 5,
                            ),
                            child: InkWell(
                              onTap: () {
                                Get.to(CreateClub());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  // image: DecorationImage(
                                  //   image: AssetImage(
                                  //       'assets/images/workshop.png'),
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                                child: Stack(
                                  children: [
                                    SvgPicture.asset(
                                        'asset/images/createclub.svg'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 4 / 5,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                  right: 10,
                                  bottom: 5,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: faintViolet,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/workshop.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: AspectRatio(
                              aspectRatio: 4 / 5,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                  right: 10,
                                  top: 5,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: shadowLight,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/seminar.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
