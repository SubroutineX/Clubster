import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/controllers/club_controller.dart';
import 'package:workflow/models/clubs.dart';
import 'package:workflow/views/styles/colors.dart';

import 'package:workflow/views/styles/styles.dart';
import 'package:workflow/views/styles/themeData.dart';

class BrowsePage extends StatefulWidget {
  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  PageController pageController;
  double viewPortFraction = 0.8;
  double scaleFraction = 0.7;
  double fullScale = 1;

  double pageOffset = 0;
  double page = 2;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
      viewportFraction: viewPortFraction,
    )..addListener(() {
        setState(() {
          pageOffset = pageController.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              "Discover",
              style: textStyleGilroyR(
                18,
                colorFont(),
              ),
            ),
          ),
          Container(
            height: 200,
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  padding: EdgeInsets.only(
                    right: 20,
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/mechanical.jpg",
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          height: 200,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                white,
                                black,
                              ],
                            ),
                          ),
                          child: Text(
                            "Dancer Mania",
                            style: textStyleGilroyB(
                              16,
                              white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: 2,
            ),
          )
        ],
      ),
    );
  }
}
