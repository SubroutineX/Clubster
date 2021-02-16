import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/models/news_feed.dart';

class FetchNewsFeedController extends GetxController {
  var newsFeed = RxList<NewsFeed>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFeed();
  }

  void fetchFeed() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final token = sharedPreferences.getString('token');
      var response = await http.get(
        "http://65.1.43.39:8000/fetchNewsFeed",
        headers: {"Authorization": "Bearer $token"},
      );
      if (response.statusCode == 200) {
        newsFeed.value = newsFeedFromJson(response.body);
        print(response.body);
        print(newsFeed.length);
      }
    } catch (error) {
      print(error);
    }
  }
}
