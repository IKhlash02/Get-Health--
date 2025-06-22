import 'package:get/get.dart';
import 'package:get_healt_2/data/models/alamat_user_model.dart';
import 'package:get_healt_2/data/models/user_model.dart';
import 'package:get_healt_2/data/repositories/profile_repository.dart';
import 'package:get_healt_2/routes/app_routes.dart';

class ProfileController extends GetxController {
  final ProfileRepository _repository = Get.find<ProfileRepository>();

  // --- STATES ---
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  // --- MODELS ---
  var user = Rxn<UserModel>();
  var address = Rxn<AddressModel>();

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  Future<void> fetchProfileData() async {
    try {
      isLoading(true);
      final profileData = await _repository.getProfileData();
      user.value = profileData['user'];
      address.value = profileData['address'];
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    Get.offAllNamed(Routes.login);
  }

  void goToEditProfile() {
    if (user.value != null) {
      Get.toNamed(Routes.editUserAccount, arguments: user.value);
    }
  }

  void goToEditAddress() {
    if (address.value != null) {
      Get.toNamed(Routes.editAddress, arguments: address.value);
    }
  }
}
