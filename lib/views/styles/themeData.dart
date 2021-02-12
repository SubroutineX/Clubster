import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

Color cardColor() {
  if (Get.isDarkMode) {
    return cardDark;
  } else {
    return white;
  }
}

Color dividerColor() {
  if (Get.isDarkMode) {
    return backgroundLightDark;
  } else {
    return Color(0xFFECF8FF);
  }
}

Color inputFieldColor() {
  if (Get.isDarkMode) {
    return inputBackgroundDark;
  } else {
    return inputBackgroundLight;
  }
}

Color bw() {
  if (Get.isDarkMode) {
    return black;
  } else {
    return white;
  }
}

Color colorFont() {
  if (Get.isDarkMode) {
    return white;
  } else {
    return fontColor;
  }
}

Color colorFontLight() {
  if (Get.isDarkMode) {
    return fontColorDark;
  } else {
    return fontColorLight;
  }
}
