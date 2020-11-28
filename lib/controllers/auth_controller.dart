import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/views/clubs/clubs.dart';
import 'package:workflow/views/tab_view.dart';

class AuthController extends GetxController {
  static const IP_SERVER =
      '192.168.0.17'; //atharva:192.168.0.18 , nuke:192.168.43.217

  void loginUser(String phone, String password) async {
    try {
      var response = await http.post("http://$IP_SERVER:8000/login",
          body: {'phone': phone, 'password': password});

      if (response.statusCode == 200) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool("logged-in", true);
        Get.off(Clubs());
      } else {
        Get.snackbar('error signing In', response.body,
            snackPosition: SnackPosition.TOP);
      }
    } catch (error) {
      print(error.message);
      Get.snackbar('Error signing In', error.message,
          snackPosition: SnackPosition.TOP);
    }
  }

  void logoutUser() async {
    try {
      var response = await http.delete("http://$IP_SERVER:8000/logout");
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
