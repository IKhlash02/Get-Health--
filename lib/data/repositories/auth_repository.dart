import 'package:get/get.dart';
import 'package:get_healt_2/data/services/storage_services.dart';

class AuthRepository {
  // Inject service yang dibutuhkan
  final StorageService _storageService = Get.find<StorageService>();

  // Fungsi login yang bersih
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      // final response = await http.post(
      //   Uri.parse(ApiEndPoints.login), // Ganti dengan rute yang benar
      //   body: {
      //     "email_user": email,
      //     "password_user": password,
      //   },
      // );

      // final data = jsonDecode(response.body);

      // if (response.statusCode == 200 && data['value'] == 1) {
      //   await _storageService.write('id_user', data['id_user']);
      //   await _storageService.write('id_alamat', data['id_alamat']);
      // } else {
      //   throw data['message'] ?? "Terjadi kesalahan yang tidak diketahui";
      // }
      await _storageService.write('id_user', "12345"); // Simulasi ID user
      await _storageService.write('id_alamat', "67890"); // Simulasi ID alamat
    } catch (e) {
      rethrow;
    }
  }
}
