import 'package:flutter/material.dart';
import 'package:workflow/models/clubs.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';
import 'package:workflow/views/widgets/club_cards.dart';

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
      color: bw(),
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
                      colorFont(),
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
                      colorFont(),
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
