import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/models/profile_model.dart';

class ProfileController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfileData();
  }

  void getProfileData() async {
    var profileData = Profile().obs;
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.get(
        "http://65.1.43.39:8000/profileData",
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        profileData.value = profileFromJson(response.body);

        print(profileData.value.userData.id);
        print(profileData.value.createdClubs[0].college);
      } else {
        var result = jsonDecode(response.body);
        Get.snackbar("Error", result);
      }
    } catch (error) {
      Get.snackbar("Error", error);
    }
  }
}
