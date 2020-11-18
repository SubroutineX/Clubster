import 'package:flutter/material.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

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
        left: 20,
      ),
      child: Container(
        width: 160,
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
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(imgUrl),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: productTitleStyle,
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
              right: 20,
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
                                color: yellow,
                                size: 16,
                              )
                            : Icon(
                                Icons.bookmark_outline_rounded,
                                color: Colors.grey[400],
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
                                color: Colors.grey[400],
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
    );
  }
}
