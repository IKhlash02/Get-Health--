import 'package:get/get.dart';
import 'package:get_healt_2/controller/navigation_controller.dart';
import 'package:get_healt_2/data/providers/network/api_provider.dart';
import 'package:get_healt_2/data/repositories/home_repository.dart';
import 'package:get_healt_2/data/repositories/profile_repository.dart';
import 'package:get_healt_2/modules/home/controllers/home_controller.dart';
import 'package:get_healt_2/modules/profile/controllers/profile_controller.dart';
// ... import controller dan repository lainnya

class MainLayoutBinding extends Bindings {
  @override
  void dependencies() {
    // Controller untuk navigasi itu sendiri
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<ApiProvider>(() => ApiProvider());

    // Tab 0: Home
    Get.lazyPut<HomeRepository>(() => HomeRepository());
    Get.lazyPut<HomeController>(() => HomeController());

    // Tab 1: Notifikasi (Contoh)
    // Get.lazyPut<NotificationRepository>(() => NotificationRepository());
    // Get.lazyPut<NotificationController>(() => NotificationController());

    // Tab 2: Keranjang (Contoh)
    // ...

    // Tab 4: Profile
    Get.lazyPut<ProfileRepository>(() => ProfileRepository());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
