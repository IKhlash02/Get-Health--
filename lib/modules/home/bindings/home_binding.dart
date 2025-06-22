// lib/app/modules/home/bindings/home_binding.dart
import 'package:get/get.dart';
import 'package:get_healt_2/data/repositories/home_repository.dart';
import 'package:get_healt_2/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRepository>(() => HomeRepository());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
