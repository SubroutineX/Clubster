import 'package:flutter/material.dart';
import 'package:workflow/models/clubs.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

class ProfileClubs extends StatelessWidget {
  List<Club> clubs = [
    Club(
      clubName: "Rocket Science",
      genre: "Tech",
      id: "assets/images/mechanical.jpg",
      memberLimit: 28,
    ),
    Club(
      clubName: "Coders",
      genre: "Tech",
      id: "assets/images/python.jpg",
      memberLimit: 16,
    ),
    Club(
      clubName: "Placement Cell",
      genre: "General",
      id: "assets/images/guest.jpg",
      memberLimit: 51,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Created ",
                    style: textStyleGilroyB(
                      18,
                      blue,
                    ),
                  ),
                  TextSpan(
                    text: "Clubs",
                    style: textStyleGilroyB(
                      18,
                      fontColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyClubCard(
                  clubImagePath: "assets/images/cricket.jpg",
                  clubName: "Cricket Club",
                  creationDate: "10 Nov 2019",
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                MyClubCard(
                  clubImagePath: "assets/images/inventors.jpg",
                  clubName: "Inventerrs",
                  creationDate: "19 Jan 2020",
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyClubCard(
                  clubImagePath: "assets/images/dancers.jpg",
                  clubName: "Dancer Mania",
                  creationDate: "28 May 2020",
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                CreateMyClubCard(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Joined ",
                    style: textStyleGilroyB(
                      18,
                      blue,
                    ),
                  ),
                  TextSpan(
                    text: "Clubs",
                    style: textStyleGilroyB(
                      18,
                      fontColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  for (int i = 0; i < clubs.length; i++)
                    clubBuilder(
                      clubs[i].clubName,
                      clubs[i].id,
                      clubs[i].memberLimit,
                      clubs[i].genre,
                    )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}

class MyClubCard extends StatelessWidget {
  MyClubCard({
    Key key,
    @required this.clubImagePath,
    @required this.clubName,
    @required this.creationDate,
    this.borderRadius,
  }) : super(key: key);

  final String clubImagePath;
  final String clubName;
  final String creationDate;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 0.85,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(clubImagePath),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                        clubName,
                        style: textStyleGilroySB(
                          16,
                          white,
                        ),
                      ),
                      Text(
                        creationDate,
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
            color: white,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.10),
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
                  style: TextStyle(
                    fontFamily: "Gilroy_SemiBold",
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      genre,
                      style: TextStyle(
                        fontFamily: "Gilroy_SemiBold",
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      " \u2022 ",
                      style: TextStyle(
                        fontFamily: "Gilroy_SemiBold",
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      members.toString() + " members",
                      style: TextStyle(
                        fontFamily: "Gilroy_SemiBold",
                        fontSize: 14,
                        color: Colors.grey[500],
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
