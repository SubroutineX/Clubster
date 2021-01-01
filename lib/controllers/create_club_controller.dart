import 'package:get/get.dart';
import 'dart:io';
import 'package:dio/dio.dart' as D;
import 'package:shared_preferences/shared_preferences.dart';

class CreateClubController extends GetxController {
  static const IP_SERVER = '192.168.0.13';
  String name, genre, status, description;
  String memberLimit;

  void getName(getName) {
    name = getName;
  }

  void getGenre(getGenre) {
    genre = getGenre;
    print(genre.runtimeType);
  }

  void getdescription(getDescription) {
    description = getDescription;
  }

  void getLimit(getLimit) {
    memberLimit = getLimit;
  }

  void getStatus(getStatus) {
    status = getStatus;
  }

  void createClub(File image) async {
    try {
      if (image.isNull) {
        Get.snackbar("Error creating Club", "select image for club");
      } else if (name?.isEmpty ?? true) {
        Get.snackbar("Error Creating Club", "name field empty");
      } else if (genre?.isEmpty ?? true) {
        Get.snackbar("Error Creating Club", "genre field empty");
      } else if (memberLimit?.isEmpty ?? true) {
        Get.snackbar("Error Creating Club", "Limit field empty");
      } else if (description?.isEmpty ?? true) {
        Get.snackbar("Error Creating Club", "description field empty");
      } else {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        final token = sharedPreferences.getString('token');
        D.Dio dio = new D.Dio();
        String fileName = image.path.split("/").last;
        D.FormData formdata = D.FormData.fromMap({
          'clubName': name,
          'genre': genre,
          'memberLimit': memberLimit,
          'description': description,
          'status': status,
          "clubImage": await D.MultipartFile.fromFile(
            image?.path,
            filename: fileName,
          )
        });
        var response = await dio.post("http://$IP_SERVER:8000/registerClub",
            data: formdata,
            options: D.Options(
              headers: {"Authorization": "Bearer $token"},
            ));
        if (response.statusCode == 200) {
          Get.snackbar("Success", response.data);
        } else {
          Get.snackbar("Error creating Club", response.data);
        }
      }
    } catch (error) {
      print(error);
      Get.snackbar("Error Creating Club", error);
    }
  }
}
