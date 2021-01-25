import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/models/clubs.dart';
import 'package:http/http.dart' as http;

class ClubController extends GetxController {
  var clubs = List<Clubs>().obs;
  static const IP_SERVER = '192.168.0.11';

  @override
  void onInit() {
    super.onInit();
    fetchClubs();
  }

  void fetchClubs() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.get(
        "https://clubify-node.herokuapp.com/fetchClubs",
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        clubs.value = clubsFromJson(response.body);
        print(clubs.value[0].clubName);
        print(clubs.value[0].elite);
      }
    } catch (error) {
      print(error);
    }
  }
}
