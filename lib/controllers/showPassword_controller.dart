import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class ShowPassController extends GetxController {
  bool invisible = true;

  void showPass(TapDownDetails details) {
    invisible = !invisible;
    update();
  }

  void hidePass(TapUpDetails details) {
    invisible = !invisible;
    update();
  }
}
