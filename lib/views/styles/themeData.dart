import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

Color bw() {
  if (Get.isDarkMode) {
    return black;
  } else {
    return white;
  }
}

Color shadowColor() {
  if (Get.isDarkMode) {
    return shadowDark;
  } else {
    return shadowLight;
  }
}

Color cardColor() {
  if (Get.isDarkMode) {
    return backgroundDarkLight;
  } else {
    return backgroundLight;
  }
}

Color dividerColor() {
  if (Get.isDarkMode) {
    return backgroundDarkLight;
  } else {
    return Color(0xFFECF8FF);
  }
}

Color commentDividerColor() {
  if (Get.isDarkMode) {
    return backgroundDarkLight;
  } else {
    return Color(0xFFBCBDC4);
  }
}

Color inputFieldColor() {
  if (Get.isDarkMode) {
    return inputBackgroundDark;
  } else {
    return inputBackgroundLight;
  }
}

Color inputFontColor() {
  if (Get.isDarkMode) {
    return inputFontDark;
  } else {
    return fontColorLightSub;
  }
}

Color colorFont() {
  if (Get.isDarkMode) {
    return fontColorDark;
  } else {
    return fontColorLight;
  }
}

Color colorFontLight() {
  if (Get.isDarkMode) {
    return fontColorDarkSub;
  } else {
    return fontColorLightSub;
  }
}
