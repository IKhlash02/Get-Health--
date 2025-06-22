import 'package:get/get.dart';
import 'package:get_healt_2/data/models/address_model.dart';
import 'package:get_healt_2/data/models/user_model.dart';
import 'package:get_healt_2/data/providers/local/json_provider.dart';
import 'package:get_healt_2/data/providers/network/api_endpoint.dart';
import 'package:get_healt_2/data/providers/network/api_provider.dart';
import 'package:get_healt_2/data/services/storage_services.dart';

// ... import lainnya

class ProfileRepository {
  final bool useDummyData = true; // Flag untuk beralih

  final ApiProvider _apiProvider = Get.find<ApiProvider>();
  final JsonProvider _jsonProvider = JsonProvider();
  final StorageService _storageService = Get.find<StorageService>();

  Future<Map<String, dynamic>> getProfileData() async {
    if (useDummyData) {
      await Future.delayed(const Duration(seconds: 1));
      final data =
          await _jsonProvider.readJson('assets/json/dummy_user_profile.json');
      return {
        'user': UserModel.fromJson(data['user']),
        'address': AddressModel.fromJson(data['address']),
      };
    } else {
      // Logika API: Panggil 2 endpoint secara bersamaan
      final userId = _storageService.getUserId();
      if (userId == null) throw 'User tidak ditemukan. Silakan login ulang.';

      final userFuture = _apiProvider.get('${ApiEndPoints.userSatu}$userId');
      final addressFuture =
          _apiProvider.get('${ApiEndPoints.alamatUser}$userId');

      final responses = await Future.wait([userFuture, addressFuture]);

      return {
        'user': UserModel.fromJson(responses[0].data),
        'address': AddressModel.fromJson(responses[1].data),
      };
    }
  }

  Future<void> logout() async {
    await _storageService.clearAll();
  }

  Future<void> updateAddress(AddressModel address) async {
    print("DUMMY: Mengupdate alamat ke ${address.detailAlamat}");
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> updateUser(UserModel userModel) async {
    print("DUMMY: Mengupdate alamat ke ${userModel.namaUser}");
    await Future.delayed(const Duration(seconds: 1));
  }
}
