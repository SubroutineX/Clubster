import 'package:flutter/material.dart';

//PACKAGES
import 'package:auto_size_text/auto_size_text.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//PAGES
import 'package:workflow/views/clubs/club_details/club_details_page.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

//WIDGETS
import 'package:workflow/views/widgets/buttonBuilder.dart';

class ClubCardVertical extends StatelessWidget {
  dynamic clubInfoCard;
  String token;
  ClubCardVertical({this.clubInfoCard});

  @override
  void initState() {
    getToken();
  }

  void getToken() async {
    print("calledddd");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(
            ClubDetailsPage(clubInfoPage: clubInfoCard),
            duration: Duration(milliseconds: 250),
          );
        },
        child: Container(
          width: 170,
          height: 250,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowColor(),
                blurRadius: 10,
                spreadRadius: -10,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 165,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: clubInfoCard.id,
                      child: Image.network(
                        "http://65.1.43.39:8000/fetchClubImage?imageName=" +
                            clubInfoCard.clubName +
                            ".jpg",
                        headers: {"Authorization": "Bearer $token"},
                        fit: BoxFit.cover,
                      ),
                      // child: Image(
                      //   fit: BoxFit.cover,
                      //   image: AssetImage(clubInfoCard.imgUrl),
                      // ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                left: 0,
                child: Container(
                  width: 165,
                  height: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: cardColor(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        clubInfoCard.clubName,
                        style: textStyleSofiaSB(
                          16,
                          colorFont(),
                        ),
                        minFontSize: 15,
                        stepGranularity: 3,
                        maxLines: 2,
                        textScaleFactor: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status",
                                style: textStyleSofiaR(
                                  12,
                                  colorFontLight(),
                                ),
                                textScaleFactor: 1,
                              ),
                              SizedBox(height: 3),
                              Text(
                                clubInfoCard.status,
                                style: textStyleSofiaR(
                                  15,
                                  colorFont(),
                                ),
                                textScaleFactor: 1,
                              ),
                            ],
                          ),
                          Text(
                            '#100',
                            style: textStyleSofiaR(
                              12,
                              colorFont(),
                            ),
                            textScaleFactor: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   right: 15,
              //   top: 10,
              //   child: Container(
              //     width: 65,
              //     height: 28,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         BookmarkButtonBuilder(
              //           pageInfo: clubInfoCard,
              //           size: 28,
              //           iconSize: 18,
              //           shadowColor: fontColor.withOpacity(.1),
              //         ),
              //         LikeButtonBuilder(
              //           pageInfo: clubInfoCard,
              //           size: 28,
              //           iconSize: 18,
              //           shadowColor: fontColor.withOpacity(.1),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
