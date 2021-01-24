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
          width: 155,
          height: 220,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 150,
                  height: 130,
                  decoration: BoxDecoration(
                    color: clubsBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: clubInfoCard.id,
                      child: Image.network(
                        "http://192.168.43.152:8000/fetchClubImage?imageName=" +
                            clubInfoCard.clubName +
                            ".jpg",
                        headers: {"Authorization": "Bearer $token"},
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
                top: 100,
                left: 0,
                child: Container(
                  width: 150,
                  height: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        clubInfoCard.clubName,
                        style: productTitleStyle,
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
                                style: catHeadStyle,
                                textScaleFactor: 1,
                              ),
                              SizedBox(height: 5),
                              Text(
                                clubInfoCard.status,
                                style: catStyle,
                                textScaleFactor: 1,
                              ),
                            ],
                          ),
                          Text(
                            '100',
                            style: idStyle,
                            textScaleFactor: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 15,
                top: 10,
                child: Container(
                  width: 65,
                  height: 28,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BookmarkButtonBuilder(
                        pageInfo: clubInfoCard,
                        size: 28,
                        iconSize: 18,
                        shadowColor: fontColor.withOpacity(.1),
                      ),
                      LikeButtonBuilder(
                        pageInfo: clubInfoCard,
                        size: 28,
                        iconSize: 18,
                        shadowColor: fontColor.withOpacity(.1),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
