import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/bindings/auth_binding.dart';
import 'package:get/get.dart';
import 'package:workflow/views/clubs/clubs.dart';
import 'package:workflow/views/styles/colors.dart';
import 'package:workflow/views/tab_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  print(sharedPreferences.getBool("logged-in"));

  runApp(
    GetMaterialApp(
      initialBinding: AuthBinding(),
      title: 'workflow managment demo',
      theme: ThemeData(fontFamily: "Sofia_Pro", accentColor: violet),
      debugShowCheckedModeBanner: false,
      home:
          sharedPreferences.getBool("logged-in") == true ? Clubs() : TabPage(),
    ),
  );
}
