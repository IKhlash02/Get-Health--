// lib/app/data/repositories/home_repository.dart

import 'package:get_healt_2/config/assets.dart';
import 'package:get_healt_2/data/models/category_model.dart';
import 'package:get_healt_2/data/models/product_model.dart';
import 'package:get_healt_2/data/providers/local/json_provider.dart';

class HomeRepository {
  final JsonProvider _jsonProvider = JsonProvider();
  final bool useDummyData = true;

  Future<List<ProductModel>> getBestSellingProducts() async {
    if (useDummyData) {
      return _getDummyProducts();
    } else {
      return _getProductsFromApi();
    }
  }

  Future<List<ProductModel>> _getProductsFromApi() async {
    try {
      // final response = await _apiProvider.get(ApiEndPoints.bestSellingProducts);
      // if (response.data is List) {
      //   return (response.data as List)
      //       .map((json) => ProductModel.fromJson(json))
      //       .toList();
      // }
      throw 'Format data produk tidak valid';
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>> _getDummyProducts() async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final jsonData =
          await _jsonProvider.readJson('assets/json/dummy_products.json');

      if (jsonData is List) {
        return jsonData.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw 'Format data dummy tidak valid (bukan List)';
      }
    } catch (e) {
      rethrow;
    }
  }

  List<CategoryModel> getCategories() {
    return [
      CategoryModel(id: 1, imageAsset: Assets.medicine, title: 'Obat'),
      CategoryModel(id: 2, imageAsset: Assets.herbal, title: 'Herbal'),
      CategoryModel(
          id: 3, imageAsset: Assets.vitamin, title: 'Suplemen\ndan Vitamin'),
      CategoryModel(
          id: 4, imageAsset: Assets.medicalEquipment, title: 'Alat Kesehatan'),
      CategoryModel(id: 5, imageAsset: Assets.beauty, title: 'Kecantikan'),
      CategoryModel(id: 6, imageAsset: Assets.cosmetics, title: 'Kosmetik'),
      CategoryModel(id: 7, imageAsset: Assets.hygiene, title: 'Kebersihan'),
      CategoryModel(id: 8, imageAsset: Assets.nutrition, title: 'Nutrisi'),
      CategoryModel(
          id: 9, imageAsset: Assets.motherAndChild, title: 'Ibu & Anak')
    ];
  }
}
