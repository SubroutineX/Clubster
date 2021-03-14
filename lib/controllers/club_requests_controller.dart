import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:workflow/models/requests_model.dart';

class ClubRequestsController extends GetxController {
  var requests = <Requests>[].obs;

  void fetchRequests(String clubId, String status) async {
    try {
      var type = 'club';
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.get(
        "http://65.1.43.39:8000/fetchRequests?id=$clubId&status=$status&type=$type",
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

  void handleRequest(
      String requestId, String clubId, String user, String status) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final token = sharedPreferences.getString('token');
    var response = await http.post(
      "http://65.1.43.39:8000/handleRequest?requestId=$requestId&clubId=$clubId",
      body: {'user': user, 'status': status},
      headers: {"Authorization": "Bearer $token"},
    );
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Get.snackbar('Success', body);
    } else {
      var body = jsonDecode(response.body);
      Get.snackbar("Error", body);
    }
  }
}
