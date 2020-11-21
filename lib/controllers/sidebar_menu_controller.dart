import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController
    with SingleGetTickerProviderMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> scaleAnimation;
  Animation<double> menuScaleAnimation;
  Animation<Offset> slideAnimation;

  void initState() {
    _controller = AnimationController(vsync: this, duration: duration);
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  void dispose() {
    _controller.dispose();
  }

  void menuClicked() {
    if (isCollapsed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    isCollapsed = !isCollapsed;
  }
}
