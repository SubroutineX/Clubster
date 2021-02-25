import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

//PACKAGES
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/bindings/auth_binding.dart';

//GETX CONTROLLER
import 'package:get/get.dart';
import 'package:workflow/controllers/auth_controller.dart';

//PAGES
import 'package:workflow/views/clubs/page_navigator.dart';
import 'package:workflow/views/tab_view.dart';

//STYLES
import 'package:workflow/theme.dart';

Future<void> main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.getBool("login-stat") == true) {
    final authController = Get.put(AuthController());
    var accessToken = sharedPreferences.getString('token');
    var decodedToken = JwtDecoder.decode(accessToken);
    authController.currentUser.userName = decodedToken['userName'];
    authController.currentUser.college = decodedToken['college'];
    authController.currentUser.dept = decodedToken['userName'];
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    GetMaterialApp(
      initialBinding: AuthBinding(),
      getPages: [
        GetPage(name: '/tab', page: () => TabPage()),
        GetPage(name: '/pageNav', page: () => PageNavigator()),
      ],
      title: 'workflow managment demo',
      theme: customTheme(),
      debugShowCheckedModeBanner: false,
      home: sharedPreferences.getBool("login-stat") == true
          ? PageNavigator()
          : TabPage(),
    ),
  );
}
