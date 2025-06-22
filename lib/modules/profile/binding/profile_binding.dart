import 'package:get/get.dart';
import 'package:get_healt_2/data/repositories/profile_repository.dart';
import 'package:get_healt_2/modules/profile/controllers/edit_address_controller.dart';
import 'package:get_healt_2/modules/profile/controllers/edit_user_controller.dart';
import 'package:get_healt_2/modules/profile/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileRepository>(() => ProfileRepository());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<EditAddressController>(() => EditAddressController());
    Get.lazyPut<EditUserController>(() => EditUserController());
  }
}
