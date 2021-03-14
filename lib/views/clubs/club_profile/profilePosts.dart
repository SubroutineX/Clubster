import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workflow/controllers/profile_controller.dart';
import 'package:workflow/views/clubs/club_profile/my_post_page.dart';

class ProfilePosts extends StatelessWidget {
  String token;

  @override
  void initState() {
    getToken();
  }

  void getToken() async {
    print("calledddd");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ProfileController>(
      builder: (controller) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: controller.profilePosts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  MyPostsPage(
                    index: index,
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "http://65.1.43.39:8000/fetchNewsImage?imageName=" +
                          controller.profilePosts[index].fileName,
                      headers: {"Authorization": "Bearer $token"},
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
