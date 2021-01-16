import 'package:flutter/material.dart';

//STYLES
import 'package:workflow/views/styles/styles.dart';

class TabBuilder extends StatelessWidget {
  const TabBuilder({
    Key key,
    this.tabName,
    this.color,
  }) : super(key: key);

  final String tabName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            tabName,
            style: textStyleR(16, color),
          ),
        ),
      ),
    );
  }
}
