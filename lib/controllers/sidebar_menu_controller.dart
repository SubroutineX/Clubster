import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController {
  var deviceDimensions = MediaQuery.of(Get.context).size;
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  double scaleFactor = 1;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(0);

  void showDrawer() {
    xOffset = deviceDimensions.width / 1.8;
    yOffset = 150;
    scaleFactor = .6;
    isDrawerOpen = !isDrawerOpen;
    borderRadius = BorderRadius.circular(30);
    update();
  }

  void hideDrawer() {
    xOffset = 00;
    yOffset = 00;
    scaleFactor = 1;
    isDrawerOpen = !isDrawerOpen;
    borderRadius = BorderRadius.circular(0);
    update();
  }
}
