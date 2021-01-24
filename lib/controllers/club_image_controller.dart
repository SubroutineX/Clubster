import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ClubImageController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  File imageClub;
  File imageWorkshop;
  File imageSeminar;
  Future getImage() async {
    var imagePicker = await ImagePicker.pickImage(source: ImageSource.gallery);
    imageClub = imagePicker;
    // final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    //tmpFile = File(pickedFile.path);
    print("helloww file location is ");
    print(imageClub);
    update();
  }
}
