import 'package:workflow/views/styles/colors.dart';
import 'package:flutter/material.dart';

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
                fontFamily: "Gilroy_SemiBold", fontSize: 16, color: fontColor),
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
