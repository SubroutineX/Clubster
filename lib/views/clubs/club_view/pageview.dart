import 'dart:math';

import 'package:flutter/material.dart';

import 'package:transformer_page_view/transformer_page_view.dart';

import 'package:flutter/cupertino.dart';

// 1111111 !!!!!!

class Pager extends StatefulWidget {
  Pager({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PagerState createState() => new _PagerState();
}

List<String> images = [
  "assets/images/cricket.jpg",
  "assets/images/guest.jpg",
  "assets/images/python.jpg"
];

List<String> text0 = ["Cricket Club", "Hostel hostel", "Coder mania"];
List<String> text1 = [
  "This is a cricket club f....",
  "Hostellers...",
  "Python programmers"
];

class _PagerState extends State<Pager> {
  TransformerPageController pageController;
  double viewPortFraction = 0.8;
  double pageOffset = 0;
  @override
  void initState() {
    super.initState();
    pageController = TransformerPageController(
      keepPage: true,
      loop: true,
      initialPage: 1,
      viewportFraction: viewPortFraction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        width: double.infinity,
        child: TransformerPageView(
            pageController: pageController,
            loop: true,
            viewportFraction: 0.8,
            transformer: PageTransformerBuilder(
                builder: (Widget child, TransformInfo info) {
              return Container(
                width: 100,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 30.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 100,
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          ParallaxImage.asset(
                            images[info.index],
                            position: info.position,
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: FractionalOffset.bottomCenter,
                                end: FractionalOffset.center,
                                colors: [
                                  const Color(0xFF000000),
                                  const Color(0x00FFffff),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ParallaxContainer(
                                  child: Text(
                                    text0[info.index],
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                  position: info.position,
                                  translationFactor: 300.0,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                ParallaxContainer(
                                  child: Text(
                                    text1[info.index],
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  position: info.position,
                                  translationFactor: 200.0,
                                ),
                              ],
                            ),
                            left: 10.0,
                            right: 10.0,
                            bottom: 10.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            itemCount: 3),
      ),
    );
  }
}
