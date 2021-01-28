import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:workflow/views/clubs/page_navigator.dart';

class RegisterController extends GetxController {
  String password;
  String name;
  String phone;
  String userName;

  void getName(accName) {
    name = accName;
  }

  void getUsername(user) {
    userName = user;
  }

  void getPhoneNumber(number) {
    phone = number;
  }

  void getPassword(password) {
    password = password;
  }

  static const IP_SERVER =
      '192.168.43.152'; //atharva:192.168.0.18 , nuke:192.168.43.217
  void registerUser(String user, String college, String dept) async {
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
        Get.off(PageNavigator());
      } else {
        Get.snackbar('error signing up', response.body,
            snackPosition: SnackPosition.TOP);
      }
    } catch (error) {
      Get.snackbar('error creating account', error.message);
    }
  }
}
