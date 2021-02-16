import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LikeController extends GetxController {
  void like(String postId) async {
    try {
      print(postId);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.post(
          "http://65.1.43.39:8000/like?id=$postId&type=post",
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        print(response.body);
      } else {
        print("error" + response.body);
      }
    } catch (error) {
      print(error);
    }
  }
}
