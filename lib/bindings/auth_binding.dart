import 'package:get/get.dart';
import 'package:workflow/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    print('INITIALIZED');
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
