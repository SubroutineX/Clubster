import 'package:flutter/material.dart';
import 'package:workflow/models/club_members_model.dart';

//STYLES
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class ClubMemberCard extends StatelessWidget {
  final ClubMember clubMember;
  const ClubMemberCard({
    Key key,
    this.clubMember,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: clubsBackground2.withOpacity(.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/inventors.jpg"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "user ",
                        style: memberName,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CS",
                            style: memberInfo,
                          ),
                          Text(
                            "student",
                            style: memberInfo,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 25,
              width: 40,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(.05),
                    blurRadius: 1,
                    offset: Offset(-1, 1),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Stack(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: fontColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ClubMemberCard2 extends StatelessWidget {
  final ClubMember clubMember;
  final int index;
  const ClubMemberCard2({
    Key key,
    this.clubMember,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/inventors.jpg"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        clubMember.user,
                        style: textStyleGilroyM(
                          16,
                          colorFont(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            clubMember.role,
                            style: textStyleGilroyM(
                              14,
                              colorFontLight(),
                            ),
                          ),
                          Text(
                            "Student",
                            style: textStyleGilroyM(
                              12,
                              colorFont(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              height: 25,
              width: 40,
              decoration: BoxDecoration(
                color: bw(),
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(.05),
                    blurRadius: 1,
                    offset: Offset(-1, 1),
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Stack(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        index.toString(),
                        style: TextStyle(
                          color: colorFont(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
