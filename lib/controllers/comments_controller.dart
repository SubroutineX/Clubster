import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/models/comments_model.dart';

class CommentsController extends GetxController {
  var comments = RxList<Comment>();
  void addComment(String comment, String postId) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.post(
          "http://65.1.43.39:8000/comment?id=$postId",
          body: {'comment': comment},
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

  void fetchComments(String postId) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.get(
          "http://65.1.43.39:8000/fetchComments?id=$postId",
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        comments.value = commentsFromJson(response.body);
        print(comments.value[0]);
      } else {
        print("error" + response.body);
      }
    } catch (error) {
      print(error);
    }
  }
}
