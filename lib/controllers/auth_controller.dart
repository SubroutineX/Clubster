import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/views/clubs/clubs.dart';
import 'package:workflow/views/tab_view.dart';

class AuthController extends GetxController {
  static const IP_SERVER =
      '192.168.43.217'; //atharva:192.168.0.18 , nuke:192.168.43.217
  void registerUser(String name, String userName, String user, String phone,
      String college, String dept, String password) async {
    try {
      var response = await http.post("http://$IP_SERVER:8000/register", body: {
        'name': name,
        'username': userName,
        'user': user,
        'phone': phone,
        'password': password,
        'college': college,
        'dept': dept
      });
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (error) {
      Get.snackbar('error creating account', error.message);
    }
  }

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
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      print(error.message);
      Get.snackbar('Error signing In', error.message,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logoutUser() async {
    try {
      var response = await http.delete("http://$IP_SERVER:8000/logout");
      if (response.statusCode == 200) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.clear();
        sharedPreferences.commit();
        Get.offAll(TabPage());
      } else {
        Get.snackbar('error Logging Out', response.body);
      }
    } catch (error) {
      Get.snackbar('Error Logging Out', error.message);
    }
  }
}
