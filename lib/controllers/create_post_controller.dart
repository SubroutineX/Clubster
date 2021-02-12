import 'package:get/get.dart';
import 'dart:io';
import 'package:dio/dio.dart' as D;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/controllers/fetch_news_feed_controller.dart';
import 'package:workflow/views/clubs/clubs_feed/clubs_timeline.dart';

class CreatePostController extends GetxController {
  static var captionChecker = 0;
  final newsFeedController = Get.find<FetchNewsFeedController>();
  void createPost(File postImage, String caption) async {
    try {
      print(caption + postImage.path);
      if (postImage.isNullOrBlank) {
        Get.snackbar("Error", "post image not selected");
      } else {
        if (captionChecker == 0) {
          if (caption?.isEmpty ?? true) {
            Get.snackbar(
                "Warning", "to proceed with empty caption press post again");
            captionChecker = 1;
            return;
          }
        }
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        final token = sharedPreferences.getString('token');
        D.Dio dio = new D.Dio();
        String fileName = postImage.path.split("/").last;
        D.FormData formdata = D.FormData.fromMap({
          'caption': caption,
          "postImage": await D.MultipartFile.fromFile(
            postImage?.path,
            filename: fileName,
            contentType: new MediaType("image", "jpg"),
          )
        });
        var response = await dio.post("http://65.1.43.39:8000/createPost",
            data: formdata,
            options: D.Options(
              headers: {"Authorization": "Bearer $token"},
            ));
        if (response.statusCode == 200) {
          Get.snackbar("Success", response.data);
          newsFeedController.fetchFeed();
          Get.to(Clubtimeline());
        } else {
          Get.snackbar("Error creating post", response.data);
        }
      }
    } catch (error) {
      print(error);
    }
  }
}
