import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/models/post_model.dart';

class FetchNewsFeedController extends GetxController {
  var newsFeed = RxList<Post>();
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
        newsFeed.value = postsFromJson(response.body);
        print("fetched" + newsFeed.value[0].caption);
      }
    } catch (error) {
      print(error);
    }
  }
}
