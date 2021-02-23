import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FollowsController extends GetxController {
  void follow(String name, String type) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      final token = sharedPreferences.getString('token');
      var response = await http.post("http://65.1.43.39:8000/follow",
          body: {'name': name, 'type': type},
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        Get.snackbar("success", body);
      } else {
        print("error" + response.body);
      }
    } catch (error) {
      print(error);
    }
  }

  void unfollow(String name, String type) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      final token = sharedPreferences.getString('token');
      var response = await http.post("http://65.1.43.39:8000/unfollow",
          body: {'name': name, 'type': type},
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        Get.snackbar("success", body);
      } else {
        print("error" + response.body);
      }
    } catch (error) {
      print(error);
    }
  }
}
