import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/models/profile_model.dart';
import 'package:workflow/views/clubs/my_club/club_members.dart';
import 'package:workflow/views/clubs/my_club/club_requests.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class ClubAdmin extends StatefulWidget {
  final EdClub clubInfo;

  const ClubAdmin({Key key, this.clubInfo}) : super(key: key);
  @override
  _ClubAdminState createState() => _ClubAdminState();
}

class _ClubAdminState extends State<ClubAdmin> with TickerProviderStateMixin {
  TabController _tabController;

  String token;

  void getToken() async {
    print("calledddd");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    print(token);
  }

  @override
  void initState() {
    super.initState();
    getToken();
    _tabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: deviceDimensions.height * 0.4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "http://65.1.43.39:8000/fetchClubImage?imageName=" +
                        widget.clubInfo.clubName +
                        ".jpg",
                    headers: {"Authorization": "Bearer $token"},
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: deviceDimensions.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () => Get.back(closeOverlays: true),
                            icon: Icon(
                              Icons.chevron_left,
                              color: white,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () => Get.back(closeOverlays: true),
                            icon: Icon(
                              Icons.notifications_outlined,
                              color: white,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: .7,
              minChildSize: .62,
              maxChildSize: 1,
              builder: (BuildContext context, myscrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: bw(),
                  ),
                  child: SingleChildScrollView(
                    controller: myscrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 3,
                              decoration: BoxDecoration(
                                color: inputFontLight,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.clubInfo.clubName,
                                    style: textStyleGilroySB(
                                      19,
                                      colorFont(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        widget.clubInfo.genre,
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
                                        widget.clubInfo.status,
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
                                        widget.clubInfo?.members?.length ??
                                            0.toString() + " members",
                                        style: textStyleGilroySB(
                                          14,
                                          colorFontLight(),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Description",
                                    style: textStyleGilroySB(
                                      16,
                                      colorFont(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    widget.clubInfo.description,
                                    style: textStyleGilroySB(
                                      14,
                                      colorFontLight(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: SizedBox(
                            height: 40,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  TabBar(
                                    isScrollable: true,
                                    controller: _tabController,
                                    labelStyle: textStyleGilroyM(
                                      14,
                                      white,
                                    ),
                                    unselectedLabelColor: colorFontLight(),
                                    unselectedLabelStyle: textStyleGilroyM(
                                      14,
                                      colorFontLight(),
                                    ),
                                    indicator: BoxDecoration(
                                      color: teal,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    tabs: [
                                      Tab(
                                        text: "Task List",
                                      ),
                                      Tab(
                                        text: "Members",
                                      ),
                                      Tab(
                                        text: "Requests",
                                      ),
                                      Tab(
                                        text: "Seminars",
                                      ),
                                      Tab(
                                        text: "Workshops",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: deviceDimensions.height - 100,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/underdev.png",
                                        width: 200,
                                        height: 200,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Under Development",
                                        style: textStyleGilroySB(
                                          18,
                                          colorFont(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              ClubMemberList(
                                clubId: widget.clubInfo.id,
                              ),
                              ClubRequests(
                                clubId: widget.clubInfo.id,
                              ),
                              Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/underdev.png",
                                        width: 200,
                                        height: 200,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Under Development",
                                        style: textStyleGilroySB(
                                          18,
                                          colorFont(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/underdev.png",
                                        width: 200,
                                        height: 200,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        "Under Development",
                                        style: textStyleGilroySB(
                                          18,
                                          colorFont(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
