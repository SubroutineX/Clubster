import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/bindings/auth_binding.dart';
import 'package:get/get.dart';
import 'package:workflow/theme.dart';
import 'package:workflow/views/clubs/club_home.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/tab_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    GetMaterialApp(
      initialBinding: AuthBinding(),
      title: 'workflow managment demo',
      theme: customTheme(),
      debugShowCheckedModeBanner: false,
      home: sharedPreferences.getBool("login-stat") == true
          ? ClubHome()
          : TabPage(),
    ),
  );
}
