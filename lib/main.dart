import 'package:flutter/material.dart';

//PACKAGES
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/bindings/auth_binding.dart';

//GETX CONTROLLER
import 'package:get/get.dart';

//PAGES
import 'package:workflow/views/clubs/club_skeleton.dart';
import 'package:workflow/views/tab_view.dart';

//STYLES
import 'package:workflow/theme.dart';

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
