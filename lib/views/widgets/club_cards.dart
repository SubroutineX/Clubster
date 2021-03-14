import 'package:flutter/material.dart';

//PACKAGES

//GETX CONTROLLERS
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/models/clubs.dart';
import 'package:workflow/models/profile_model.dart';

//PAGES
import 'package:workflow/views/clubs/club_details/club_details_page.dart';
import 'package:workflow/views/clubs/my_club/club_admin.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

//WIDGETS

class ClubInfoCard extends StatelessWidget {
  final Club clubInfo;
  String token;
  ClubInfoCard({this.clubInfo});

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
      padding: EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Get.to(
            ClubDetailsPage(clubInfo: clubInfo),
            duration: Duration(milliseconds: 250),
          );
        },
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "http://65.1.43.39:8000/fetchClubImage?imageName=" +
                          clubInfo.clubName +
                          ".jpg",
                      headers: {"Authorization": "Bearer $token"},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clubInfo.clubName,
                      style: textStyleGilroySB(
                        16,
                        colorFont(),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          clubInfo.genre,
                          style: textStyleGilroySB(
                            14,
                            colorFontLight(),
                          ),
                        ),
                        Text(
                          " \u2022 ",
                          style: textStyleGilroySB(
                            14,
                            colorFontLight(),
                          ),
                        ),
                        Text(
                          clubInfo.memberLimit.toString() + " members",
                          style: textStyleGilroySB(
                            14,
                            colorFontLight(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class JoinedClubInfoCard extends StatelessWidget {
  final EdClub joinedclubInfo;
  String token;
  JoinedClubInfoCard({this.joinedclubInfo});

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
      padding: EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "http://65.1.43.39:8000/fetchClubImage?imageName=" +
                          joinedclubInfo.clubName +
                          ".jpg",
                      headers: {"Authorization": "Bearer $token"},
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      joinedclubInfo.clubName,
                      style: textStyleGilroySB(
                        16,
                        colorFont(),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          joinedclubInfo.genre,
                          style: textStyleGilroySB(
                            14,
                            colorFontLight(),
                          ),
                        ),
                        Text(
                          " \u2022 ",
                          style: textStyleGilroySB(
                            14,
                            colorFontLight(),
                          ),
                        ),
                        Text(
                          joinedclubInfo.memberLimit.toString() + " members",
                          style: textStyleGilroySB(
                            14,
                            colorFontLight(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget clubBuilder(
  String name,
  String backgroundImagePath,
  int members,
  String genre,
) {
  return Padding(
    padding: EdgeInsets.only(right: 10),
    child: Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(backgroundImagePath),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: textStyleGilroySB(
                    16,
                    colorFont(),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      genre,
                      style: textStyleGilroySB(
                        14,
                        colorFontLight(),
                      ),
                    ),
                    Text(
                      " \u2022 ",
                      style: textStyleGilroySB(
                        14,
                        colorFontLight(),
                      ),
                    ),
                    Text(
                      members.toString() + " members",
                      style: textStyleGilroySB(
                        14,
                        colorFontLight(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

class MyClubCard extends StatelessWidget {
  final EdClub createdClubInfo;

  String token;

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

  MyClubCard({
    Key key,
    this.borderRadius,
    this.createdClubInfo,
  }) : super(key: key);

  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 0.85,
        child: GestureDetector(
          onTap: () => Get.to(
            ClubAdmin(
              clubInfo: createdClubInfo,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "http://65.1.43.39:8000/fetchClubImage?imageName=" +
                      createdClubInfo.clubName +
                      ".jpg",
                  headers: {"Authorization": "Bearer $token"},
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                gradient: LinearGradient(
                  begin: Alignment(0, -.5),
                  end: Alignment.bottomCenter,
                  colors: [
                    transparent,
                    black.withOpacity(.5),
                  ],
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    bottom: 15,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          createdClubInfo.clubName,
                          style: textStyleGilroySB(
                            16,
                            white,
                          ),
                        ),
                        Text(
                          createdClubInfo.timeStamp,
                          style: textStyleGilroyM(
                            12,
                            white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateMyClubCard extends StatelessWidget {
  CreateMyClubCard({
    Key key,
    this.borderRadius,
  }) : super(key: key);

  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.7,
        child: Container(
          decoration: BoxDecoration(
            color: cardColor(),
            boxShadow: [
              BoxShadow(
                color: shadowColor(),
                blurRadius: 15,
              ),
            ],
            borderRadius: borderRadius,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: blue,
                  size: 34,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Create new club",
                  style: textStyleGilroySB(
                    14,
                    blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
