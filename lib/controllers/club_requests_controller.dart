import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:workflow/models/requests_model.dart';

class ClubRequestsController extends GetxController {
  void fetchRequests(String clubId, String status) async {
    try {
      var requests = List<Requests>().obs;
      var type = 'club';
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.get(
        "http://65.1.43.39:8000/fetchRequests",
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        requests.value = requestsFromJson(response.body);
      } else {
        var body = jsonDecode(response.body);
        Get.snackbar("Error", body);
      }
    } catch (error) {
      print(error);
      Get.snackbar("Error", error);
    }
  }
}
