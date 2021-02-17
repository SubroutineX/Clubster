import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  File profileImage;
  File initialImage = File("assets/images/cricket.jpg");

  Future getProfileImage() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    update();
  }
}
