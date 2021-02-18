import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/controllers/fetch_news_feed_controller.dart';
import 'package:workflow/models/comments_model.dart';

class CommentsController extends GetxController {
  var comments = RxList<Comment>();
  final newsFeedController = Get.find<FetchNewsFeedController>();
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

  void fetchComments(String postId, int i) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.get(
          "http://65.1.43.39:8000/fetchComments?id=$postId",
          headers: {"Authorization": "Bearer $token"});
      if (response.statusCode == 200) {
        comments.value = commentsFromJson(response.body);
        var res = await http.get(
            "http://65.1.43.39:8000/commentsCount?id=$postId",
            headers: {"Authorization": "Bearer $token"});
        if (res.statusCode == 200) {
          var count = jsonDecode(res.body);
          print(count);
          newsFeedController.newsFeed.value[i].comments =
              count['commentsCount'];
          newsFeedController.newsFeed.value[i].likes = count['likesCount'];
        }
      } else {
        print("error" + response.body);
      }
    } catch (error) {
      print(error);
    }
  }
}
