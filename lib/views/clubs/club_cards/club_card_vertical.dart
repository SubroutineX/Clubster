import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/views/clubs/club_details.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

import 'package:auto_size_text/auto_size_text.dart';

class ClubCardVertical extends StatelessWidget {
  dynamic clubInfoCard;

  ClubCardVertical({this.clubInfoCard});

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
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(clubInfoCard.imgUrl),
                      ),
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
                        clubInfoCard.name,
                        style: productTitleStyle,
                        minFontSize: 15,
                        stepGranularity: 3,
                        maxLines: 2,
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
                              ),
                              SizedBox(height: 5),
                              Text(
                                clubInfoCard.status,
                                style: catStyle,
                              ),
                            ],
                          ),
                          Text(
                            clubInfoCard.id,
                            style: idStyle,
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
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: true
                              ? Icon(
                                  Icons.bookmark_rounded,
                                  color: orange,
                                  size: 16,
                                )
                              : Icon(
                                  Icons.bookmark_outline_rounded,
                                  color: Colors.grey[600],
                                  size: 16,
                                ),
                        ),
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: true
                              ? Icon(
                                  Icons.favorite_rounded,
                                  color: red,
                                  size: 16,
                                )
                              : Icon(
                                  Icons.favorite_outline_rounded,
                                  color: Colors.grey[600],
                                  size: 16,
                                ),
                        ),
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
