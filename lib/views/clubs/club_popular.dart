import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workflow/views/clubs/club_detail_popular.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

import 'package:auto_size_text/auto_size_text.dart';

class PopularClubs extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String status;
  final String id;
  final bool bookmark;
  final bool like;

  PopularClubs({
    this.imgUrl,
    this.name,
    this.status,
    this.id,
    this.bookmark,
    this.like,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(
            ClubDetailsPopular(
              clubInfo: PopularClubs(
                imgUrl: imgUrl,
                id: id,
                name: name,
                status: status,
                bookmark: bookmark,
                like: like,
              ),
            ),
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
                      tag: id,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(imgUrl),
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
                        name,
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
                                status,
                                style: catStyle,
                              ),
                            ],
                          ),
                          Text(
                            id,
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
                          child: bookmark
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
                          child: like
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
