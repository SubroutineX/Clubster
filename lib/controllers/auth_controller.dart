import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/views/clubs/page_navigator.dart';
import 'package:workflow/views/tab_view.dart';

class AuthController extends GetxController {
  static const IP_SERVER = '192.168.0.11';

  void loginUser(String phone, String password) async {
    try {
      if (phone.isEmpty || password.isEmpty) {
        Get.snackbar('error signing in', 'username or password field empty');
      } else {
        var response = await http.post("http://65.1.43.39:8000/login",
            body: {'phone': phone, 'password': password});

        if (response.statusCode == 200) {
          final body = jsonDecode(response.body);

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
      var response = await http.delete("http://65.1.43.39:8000/logout");
      if (response.statusCode == 200) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.clear();
        // sharedPreferences.commit();

        Get.offAll(TabPage());
      } else {
        Get.snackbar('error Logging Out', response.body);
      }
    } catch (error) {
      Get.snackbar('Error Logging Out', error.message);
    }
  }
}
