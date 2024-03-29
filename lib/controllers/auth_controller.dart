import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/controllers/club_controller.dart';
import 'package:workflow/controllers/club_requests_controller.dart';
import 'package:workflow/controllers/fetch_news_feed_controller.dart';
import 'package:workflow/controllers/profile_controller.dart';
import 'package:workflow/models/current_user.dart';
import 'package:workflow/views/clubs/page_navigator.dart';
import 'package:workflow/views/tab_view.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthController extends GetxController {
  static const IP_SERVER = '192.168.0.11';
  final currentUser = new CurrentUser();
  void loginUser(String phone, String password) async {
    try {
      if (phone.isEmpty || password.isEmpty) {
        Get.snackbar('error signing in', 'username or password field empty');
      } else {
        var response = await http.post("http://65.1.43.39:8000/login",
            body: {'phone': phone, 'password': password});

        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);
          var accessToken = body['accessToken'];
          var decodedToken = JwtDecoder.decode(accessToken);
          currentUser.userName = decodedToken['userName'];
          currentUser.college = decodedToken['college'];
          currentUser.dept = decodedToken['dept'];
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString('token', body['accessToken']);

          sharedPreferences.setBool('login-stat', true);
          print(sharedPreferences.getString('token'));
          Get.off(PageNavigator());
        } else {
          var body = jsonDecode(response.body);
          Get.snackbar('error signing In', body,
              snackPosition: SnackPosition.TOP);
        }
      }
    } catch (error) {
      print(error);
      Get.snackbar('Error signing In', error, snackPosition: SnackPosition.TOP);
    }
  }

  void logoutUser() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.clear();
      // sharedPreferences.commit();
      Get.delete<ClubController>();
      Get.delete<FetchNewsFeedController>();
      Get.delete<ProfileController>();
      Get.delete<ClubRequestsController>();
      Get.off(TabPage());
    } catch (error) {
      Get.snackbar('Error Logging Out', error.message);
    }
  }
}
