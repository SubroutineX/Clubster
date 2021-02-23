import 'package:flutter/material.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

//WIDGETS
import 'package:workflow/views/widgets/clubMemberCard.dart';

class ClubMembersBottomSheet extends StatelessWidget {
  const ClubMembersBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Material(
      color: white,
      child: Container(
        height: deviceDimensions.height * 0.60,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 30,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Members",
                  style: memberHeadStyle,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: blue,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Founder",
                        style: TextStyle(fontSize: 14),
                        textScaleFactor: 1,
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: violet,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "President",
                        style: TextStyle(fontSize: 14),
                        textScaleFactor: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      for (int i = 0; i < 5; i++) ClubMemberCard(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
