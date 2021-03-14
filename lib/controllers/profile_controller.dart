import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/models/post_model.dart';
import 'package:workflow/models/profile_model.dart';

class ProfileController extends GetxController {
  var profileData = Profile().obs;
  var profilePosts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProfileData();
    getProfilePosts();
  }

  void getProfileData() async {
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
        var createdlength = profileData.value.createdClubs.length;
        // print(profileData.value.userData.id);
        for (int i = createdlength; i < 4; i++) {
          profileData.value.createdClubs.add(null);
        }
        print(profileData.value.createdClubs.length);
      } else {
        var result = jsonDecode(response.body);
        Get.snackbar("Error", result);
      }
    } catch (error) {
      Get.snackbar("Error", error);
    }
  }

  void getProfilePosts() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.get(
        "http://65.1.43.39:8000/profilePosts",
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        profilePosts.value = postsFromJson(response.body);
        //  print(profilePosts.value[0].caption);
      } else {
        var result = jsonDecode(response.body);
        Get.snackbar("Error", result);
      }
    } catch (error) {
      Get.snackbar("Error", error);
    }
  }
}
