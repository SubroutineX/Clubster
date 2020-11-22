import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/controllers/club_controller.dart';
import 'package:workflow/views/clubs/club_details.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

import 'package:auto_size_text/auto_size_text.dart';

class ClubCardHorizontal extends StatelessWidget {
  dynamic clubInfoCard;

  ClubCardHorizontal({this.clubInfoCard});

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
          ClubDetailsPage(clubInfoPage: clubInfoCard),
        ),
        child: Container(
          height: 115,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: deviceDimensions.width * 0.34,
                  height: 115,
                  decoration: BoxDecoration(
                    color: white,
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
                top: 0,
                right: 0,
                child: Container(
                  width: deviceDimensions.width * 0.63,
                  height: 115,
                  padding:
                      EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                              clubInfoCard.name,
                              style: productTitleStyle,
                              minFontSize: 15,
                              stepGranularity: 3,
                              maxLines: 2,
                            ),
                          ),
                          Container(
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
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[200],
                                          blurRadius: 10)
                                    ],
                                  ),
                                  child: Center(
                                    child: GetX<ClubController>(
                                      builder: (controller) {
                                        return IconButton(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            clubInfoCard.bookmark.value =
                                                !clubInfoCard.bookmark.value;
                                          },
                                          icon: clubInfoCard.bookmark.value
                                              ? Icon(
                                                  Icons.bookmark_rounded,
                                                  size: 16,
                                                )
                                              : Icon(
                                                  Icons
                                                      .bookmark_outline_rounded,
                                                  size: 16,
                                                ),
                                          color: clubInfoCard.bookmark.value
                                              ? yellow
                                              : Colors.grey[600],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey[200],
                                          blurRadius: 10)
                                    ],
                                  ),
                                  child: Center(
                                    child: GetX<ClubController>(
                                      builder: (controller) {
                                        return IconButton(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            clubInfoCard.like.value =
                                                !clubInfoCard.like.value;
                                          },
                                          icon: clubInfoCard.like.value
                                              ? Icon(
                                                  Icons.favorite_rounded,
                                                  size: 16,
                                                )
                                              : Icon(
                                                  Icons
                                                      .favorite_outline_rounded,
                                                  size: 16,
                                                ),
                                          color: clubInfoCard.like.value
                                              ? red
                                              : Colors.grey[600],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
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
            ],
          ),
        ),
      ),
    );
  }
}
