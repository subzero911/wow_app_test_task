import 'package:get/get.dart';
import 'package:wow_app_test_task/controllers/auth_controller.dart';
import 'package:wow_app_test_task/repository/auth_provider.dart';
import 'package:wow_app_test_task/repository/auth_service.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthProvider());
    Get.put(AuthService(authProvider: Get.find()));
    Get.put(AuthController(auth: Get.find()));
  }
}
