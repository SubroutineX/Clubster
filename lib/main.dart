import 'package:flutter/material.dart';

import 'package:workflow/views/tab_view.dart';

import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'workflow managment demo',
      theme: ThemeData(fontFamily: "Sofia_Pro"),
      debugShowCheckedModeBanner: false,
      home: TabPage(),
    );
  }
}
