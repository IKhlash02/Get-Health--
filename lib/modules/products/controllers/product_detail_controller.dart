import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/data/models/product_model.dart';
import 'package:get_healt_2/data/models/ulasan_model.dart';
import 'package:get_healt_2/data/repositories/product_repository.dart';
import 'package:get_healt_2/routes/app_routes.dart';

class ProductDetailController extends GetxController {
  final ProductRepository _repository = Get.find<ProductRepository>();

  late final ProductModel product;

  var isLoadingReviews = true.obs;
  var reviews = <ReviewModel>[].obs;
  var reviewsError = ''.obs;

  var isDescriptionExpanded = false.obs;
  var quantity = 1.obs;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as ProductModel;
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    try {
      isLoadingReviews(true);
      reviewsError('');
      final result = await _repository.getProductReviews(product.idProduk);
      reviews.assignAll(result);
    } catch (e) {
      reviewsError(e.toString());
    } finally {
      isLoadingReviews(false);
    }
  }

  void toggleDescription() {
    isDescriptionExpanded.value = !isDescriptionExpanded.value;
  }

  void incrementQuantity() {
    if (quantity.value < int.parse(product.jumlahStok)) {
      quantity.value++;
    } else {
      Get.snackbar('Stok Terbatas', 'Jumlah melebihi stok yang tersedia');
    }
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  Future<void> addToCart() async {
    try {
      Get.dialog(const Center(child: CircularProgressIndicator()),
          barrierDismissible: false);
      await _repository.addToCart(product.idProduk, quantity.value);
      Get.back();
      Get.back();
      Get.snackbar(
          'Berhasil', '${product.namaProduk} ditambahkan ke keranjang');
    } catch (e) {
      Get.back();
      Get.snackbar('Gagal', e.toString());
    }
  }

  void buyNow() {
    Get.back();
    Get.toNamed(
      Routes.checkout,
      arguments: {
        'product': product,
        'quantity': quantity.value,
      },
    );
  }
}
