import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ClubImageController extends GetxController {
  final ImagePicker imagePicker = ImagePicker();
  File tmpFile;

  Future getImage() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    tmpFile = File(pickedFile.path);
    update();
  }
}
