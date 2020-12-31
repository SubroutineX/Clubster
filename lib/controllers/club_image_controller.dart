import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ClubImageController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  File image;
  Future getImage() async {
    var imagePicker = await ImagePicker.pickImage(source: ImageSource.gallery);
    image = imagePicker;

    // final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    //tmpFile = File(pickedFile.path);
    print("helloww file location is ");
    print(image);
    update();
  }
}
