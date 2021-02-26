import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class JoinClub extends GetxController {
  void joinCLub(String clubId, String status) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      if (status == 'open') {
        var response = await http.get(
            "http://65.1.43.39:8000/joinClub?clubId=$clubId",
            headers: {"Authorization": "Bearer $token"});
        if (response.statusCode == 200) {
          var body = jsonDecode(response.body);
          Get.snackbar("Success", body);
        }
      } else {}
    } catch (error) {
      print(error);
      Get.snackbar("Error", error);
    }
  }
}
