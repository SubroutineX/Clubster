import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreateClubController extends GetxController {
  static const IP_SERVER = '192.168.0.10';
  String name, genre, status, description;
  String memberLimit;

  void getName(getName) {
    name = getName;
    print(name.runtimeType);
  }

  void getGenre(getGenre) {
    genre = getGenre;
    print(genre.runtimeType);
  }

  void getdescription(getDescription) {
    description = getDescription;
    print(description.runtimeType);
  }

  void getLimit(getLimit) {
    memberLimit = getLimit;
    print(memberLimit.runtimeType);
  }

  void getStatus(getStatus) {
    status = getStatus;
    print(status.runtimeType);
  }

  void createClub() async {
    try {
      print("inside create club function");
      if (name.isEmpty) {
        Get.snackbar("Error Creating Club", "name field empty");
      } else if (genre.isEmpty) {
        Get.snackbar("Error Creating Club", "genre field empty");
      } else if (memberLimit.isEmpty) {
        Get.snackbar("Error Creating Club", "Limit field empty");
      } else if (description.isEmpty) {
        Get.snackbar("Error Creating Club", "description field empty");
      } else {
        var response =
            await http.post("http://$IP_SERVER:8000/registerClub", body: {
          'clubName': name,
          'genre': genre,
          'memberLimit': memberLimit,
          'description': description,
          'status': status
        });
        print("helloowwws");
        var body = jsonDecode(response.body);
        if (response.statusCode == 200) {
          Get.snackbar("Success", response.body);
        } else {
          Get.snackbar("Error creating Club", body);
        }
      }
    } catch (error) {
      print(error);
      Get.snackbar("Error Creating Club", error);
    }
  }
}
