import 'package:get/get.dart';
import 'package:get_healt_2/data/models/ulasan_model.dart';
import 'package:get_healt_2/data/providers/local/json_provider.dart';
import 'package:get_healt_2/data/providers/network/api_endpoint.dart';
import 'package:get_healt_2/data/providers/network/api_provider.dart';
import 'package:get_healt_2/data/services/storage_services.dart';

class ProductRepository {
  final bool useDummyData = true;

  final ApiProvider _apiProvider = ApiProvider();
  final JsonProvider _jsonProvider = JsonProvider();
  final StorageService _storageService = Get.find<StorageService>();

  Future<List<ReviewModel>> getProductReviews(String productId) async {
    if (useDummyData) {
      await Future.delayed(const Duration(seconds: 1)); // Simulasi loading
      final jsonData =
          await _jsonProvider.readJson('assets/json/dummy_reviews.json');
      if (jsonData is List) {
        return jsonData.map((json) => ReviewModel.fromJson(json)).toList();
      }
      throw 'Format data ulasan dummy salah.';
    } else {
      final response =
          await _apiProvider.get('${ApiEndPoints.ulasanSatu}$productId');
      if (response.data is List && response.data.isNotEmpty) {
        return (response.data as List)
            .map((json) => ReviewModel.fromJson(json))
            .toList();
      }
      throw 'Belum ada ulasan untuk produk ini.';
    }
  }

  Future<void> addToCart(String productId, int quantity) async {
    final userId = _storageService.getUserId();
    if (userId == null) throw 'Anda harus login terlebih dahulu.';

    if (useDummyData) {
      // --- Logika Dummy ---
      await Future.delayed(const Duration(seconds: 1));
      print(
          'DUMMY: Menambahkan produk $productId, jumlah $quantity ke keranjang user $userId');
      return;
    } else {
      final response = await _apiProvider.post(
        '${ApiEndPoints.tambahKeranjang}$productId&id_user=$userId',
        {'jumlah': quantity.toString()},
      );
      if (response.data['status'] != 'success') {
        throw response.data['message'] ?? 'Gagal menambahkan ke keranjang';
      }
    }
  }
}
