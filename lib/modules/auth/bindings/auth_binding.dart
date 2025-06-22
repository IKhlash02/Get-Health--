import 'package:get/get.dart';
import 'package:get_healt_2/modules/auth/controllers/auth_controller.dart';
import 'package:get_healt_2/data/repositories/auth_repository.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
