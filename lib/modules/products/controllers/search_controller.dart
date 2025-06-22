import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/data/models/product_model.dart';
import 'package:get_healt_2/data/repositories/product_repository.dart';
import 'package:get_healt_2/routes/app_routes.dart';

class ProductSearchController extends GetxController {
  final ProductRepository _repository = Get.find<ProductRepository>();
  final TextEditingController searchEditingController = TextEditingController();

  // --- STATES ---
  var isLoading = false.obs;
  var searchResults = <ProductModel>[].obs;
  var searchError = ''.obs;

  Timer? _debounce;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is String && Get.arguments.isNotEmpty) {
      final initialQuery = Get.arguments as String;
      searchEditingController.text = initialQuery;
      performSearch(initialQuery);
    }
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      performSearch(query);
    });
  }

  Future<void> performSearch(String query) async {
    if (query.trim().isEmpty) {
      searchResults.clear();
      searchError.value = 'Silakan masukkan kata kunci pencarian.';
      return;
    }

    try {
      isLoading(true);
      searchError('');
      final results = await _repository.searchProducts(query);
      searchResults.assignAll(results);
    } catch (e) {
      searchResults.clear();
      searchError(e.toString().replaceAll("Exception: ", ""));
    } finally {
      isLoading(false);
    }
  }

  void goToProductDetail(ProductModel product) {
    Get.toNamed(Routes.productDetail, arguments: product);
  }

  @override
  void onClose() {
    _debounce?.cancel();
    searchEditingController.dispose();
    super.onClose();
  }
}
