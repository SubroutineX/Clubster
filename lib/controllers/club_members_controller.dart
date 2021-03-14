import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/models/club_members_model.dart';

class ClubMembersController extends GetxController {
  var clubMembers = <ClubMember>[].obs;
  void fetchClubMembers(String clubId) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.get(
        "http://65.1.43.39:8000/clubMembers?clubId=$clubId",
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        clubMembers.value = clubMembersFromJson(response.body);
        print(clubMembers.value[0].user);
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
