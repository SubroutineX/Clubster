import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class DefaultGradientScaffold extends StatelessWidget {
  DefaultGradientScaffold({
    Key key,
    @required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(1, -1),
          colors: Get.isDarkMode
              ? [black, black]
              : [
                  // lightred,
                  white,
                  Color(0xffffffff),
                ],
          radius: .80,
          focal: Alignment(0.9, -1),
        ),
      ),
      child: Scaffold(
        backgroundColor: transparent,
        body: body,
      ),
    );
  }
}
