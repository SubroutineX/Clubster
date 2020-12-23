import 'package:get/get.dart';

class StatusSelector extends GetxController {
  var value = 'open';

  void changeStatus(var status) {
    value = status;
    update();
  }
}
