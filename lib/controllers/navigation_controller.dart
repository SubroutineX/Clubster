import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubNavigationController extends GetxController {
  final pageController = PageController();
  var selectedTab = 0;

  void changeIndex(int i) {
    selectedTab = i;
    update();
  }
}
