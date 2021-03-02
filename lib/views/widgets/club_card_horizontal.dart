import 'package:flutter/material.dart';

//PACKAGES
import 'package:auto_size_text/auto_size_text.dart';

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/models/clubs.dart';

//PAGES
import 'package:workflow/views/clubs/club_details/club_details_page.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

//WIDGETS
import 'package:workflow/views/widgets/buttonBuilder.dart';

class ClubCardHorizontal extends StatelessWidget {
  Club clubInfo;
  String token;
  ClubCardHorizontal({this.clubInfo});

  void getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    print(token);
  }

  @override
  void initState() {
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    var width63 = deviceDimensions.width * 0.63;
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15,
      ),
      child: GestureDetector(
        onTap: () => Get.to(
          ClubDetailsPage(clubInfo: clubInfo),
        ),
        child: Container(
          height: 135,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: shadowColor(),
                blurRadius: 20,
                spreadRadius: -10,
                offset: Offset(0, 10),
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
                  width: deviceDimensions.width * 0.42,
                  height: 135,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                        tag: clubInfo.id,
                        child: Image.network(
                          "http://65.1.43.39:8000/fetchClubImage?imageName=" +
                              clubInfo.clubName +
                              ".jpg",
                          headers: {"Authorization": "Bearer $token"},
                          fit: BoxFit.cover,
                        )
                        //child: Image(
                        //fit: BoxFit.cover,
                        //image: AssetImage(clubInfo.imgUrl),
                        //  ),
                        ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: deviceDimensions.width * 0.56,
                  height: 135,
                  padding:
                      EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: cardColor(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width63 - 95,
                            child: AutoSizeText(
                              clubInfo.clubName,
                              style: textStyleSofiaSB(
                                16,
                                colorFont(),
                              ),
                              minFontSize: 15,
                              stepGranularity: 3,
                              maxLines: 2,
                            ),
                          ),
                        ],
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
                              ),
                              SizedBox(height: 3),
                              Text(
                                clubInfo.status,
                                style: textStyleSofiaR(
                                  15,
                                  colorFont(),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '#100',
                            style: textStyleSofiaR(
                              12,
                              colorFont(),
                            ),
                          ),
                        ],
                      )
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

class Genre {
  final String name;
  final String imagePath;
  final int servingRestaurants;
  final Color backgroungColor;

  Genre(
    this.name,
    this.imagePath,
    this.servingRestaurants,
    this.backgroungColor,
  );
}

List<Genre> genres = [
  Genre(
    "Sports",
    "assets/images/sport.png",
    21,
    Colors.green[100],
  ),
  Genre(
    "Music",
    "assets/images/music.png",
    28,
    Colors.orangeAccent[100],
  ),
  Genre(
    "Tech",
    "assets/images/tech.png",
    54,
    Colors.blue[100],
  ),
  Genre(
    "Dance",
    "assets/images/dance.png",
    34,
    Colors.pink[100],
  ),
];

Widget genreBuilder(
  String name,
  String imagePath,
  int clubs,
  Color backgroundColor,
) {
  return Padding(
    padding: EdgeInsets.only(right: 20),
    child: Container(
      height: 160,
      width: 130,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              fontFamily: "Gilroy_SemiBold",
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            clubs.toString() + " Clubs",
            style: TextStyle(
              fontFamily: "Gilroy_Medium",
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 70,
            width: 70,
            child: Center(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
