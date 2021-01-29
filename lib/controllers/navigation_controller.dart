import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final pageController = PageController();

  // var selectedTab = 0;

  int currentIndex = 2;

  String currentPage = "Page3";

  List<String> pageKeys = ["Page1", "Page2", "Page3", "Page4", "Page5"];

  Map<String, GlobalKey<NavigatorState>> navigatorKeys = {
    "Page1": GlobalKey<NavigatorState>(),
    "Page2": GlobalKey<NavigatorState>(),
    "Page3": GlobalKey<NavigatorState>(),
    "Page4": GlobalKey<NavigatorState>(),
    "Page5": GlobalKey<NavigatorState>(),
  };

  // void changeIndex(int i) {
  //   selectedTab = i;
  //   update();
  // }

  void selectTab(String tabItem, int index) {
    if (tabItem == currentPage) {
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      currentPage = pageKeys[index];
      currentIndex = index;
      update();
    }
  }
}
