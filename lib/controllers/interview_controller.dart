import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'club_requests_controller.dart';

class InterviewController extends GetxController {
  final clubRequestsController = Get.find<ClubRequestsController>();
  void scheduleInterview(String user, String description, String date,
      String time, String clubId, String requestId) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.post(
        "http://65.1.43.39:8000/scheduleInterview?clubId=$clubId&requestId=$requestId",
        body: {
          'user': user,
          'description': description,
          'date': date,
          'time': time
        },
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        clubRequestsController.fetchRequests(clubId, 'pending');
        Get.snackbar("Success", body);
      } else {
        var body = jsonDecode(response.body);
        Get.snackbar('Error', body);
      }
    } catch (error) {
      print(error);
      Get.snackbar('Error', error);
    }
  }
}
