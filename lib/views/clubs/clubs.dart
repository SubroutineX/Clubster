import 'dart:ui' as ui;

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:workflow/views/animations/FadeAnimation.dart';
import 'package:workflow/views/clubs/club_model/club_other_model.dart';
import 'package:workflow/views/clubs/club_model/club_popular_model.dart';
import 'package:workflow/views/clubs/club_other.dart';
import 'package:workflow/views/clubs/club_popular.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/styles/styles.dart';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Clubs extends StatefulWidget {
  @override
  _ClubsState createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var deviceDimensions = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: clubsBackground,
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications_active_rounded,
                color: fontColor,
              ),
              onPressed: null),
        ],
        iconTheme: IconThemeData(color: fontColor),
        centerTitle: true,
        backgroundColor: transparent,
        elevation: 0,
        title: Text(
          "Clubs",
          style: appBarHead,
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: BubbleBottomBar(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          backgroundColor: white,
          opacity: 1,
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: changePage,
          items: [
            BubbleBottomBarItem(
              backgroundColor: faintViolet,
              activeIcon: Icon(
                Icons.home_rounded,
                color: violet,
              ),
              icon: Icon(
                Icons.home_rounded,
                color: fontColorLight,
              ),
              title: Text(
                "Clubs",
                style: bottomBarItemStyle,
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: faintViolet,
              activeIcon: Icon(
                Icons.favorite_outline_rounded,
                color: violet,
              ),
              icon: Icon(
                Icons.favorite_outline_rounded,
                color: fontColorLight,
              ),
              title: Text(
                "Favourites",
                style: bottomBarItemStyle,
              ),
            ),
            BubbleBottomBarItem(
              backgroundColor: faintViolet,
              activeIcon: Icon(
                Icons.person_rounded,
                color: violet,
              ),
              icon: Icon(
                Icons.person_rounded,
                color: fontColorLight,
              ),
              title: Text(
                "Profile",
                style: bottomBarItemStyle,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: deviceDimensions.height,
        width: deviceDimensions.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          1,
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Popular",
                              style: appBarHead,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 220,
                          width: deviceDimensions.width,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            child: Row(
                              children: [
                                SizedBox(width: 20),
                                for (int i = 0; i < popularClubs.length; i++)
                                  PopularClubs(
                                    imgUrl: popularClubs[i].image,
                                    name: popularClubs[i].name,
                                    status: popularClubs[i].status,
                                    id: popularClubs[i].id,
                                    bookmark: popularClubs[i].bookmark,
                                    like: popularClubs[i].like,
                                  ),
                                SizedBox(width: 5),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          1,
                          Text(
                            "Other",
                            style: appBarHead,
                          ),
                        ),
                        SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              for (int j = 0; j < otherClubs.length; j++)
                                OtherClubs(
                                  imgUrl: otherClubs[j].image,
                                  name: otherClubs[j].name,
                                  status: otherClubs[j].status,
                                  id: otherClubs[j].id,
                                  bookmark: otherClubs[j].bookmark,
                                  like: otherClubs[j].like,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: deviceDimensions.width,
                padding: EdgeInsets.symmetric(horizontal: 22),
                height: 80,
                decoration: BoxDecoration(
                  color: clubsBackground,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        )
                      ],
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 18, right: 12),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search clubs...",
                            hintStyle: searchBarStyle,
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
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
