import 'package:flutter/material.dart';
import 'package:workflow/bindings/auth_binding.dart';
import 'package:get/get.dart';
import 'package:workflow/views/tab_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      title: 'workflow managment demo',
      theme: ThemeData(fontFamily: "Sofia_Pro"),
      debugShowCheckedModeBanner: false,
      home: TabPage(),
    );
  }
}
