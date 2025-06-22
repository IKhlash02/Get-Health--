import 'package:get/get.dart';
import 'package:get_healt_2/data/repositories/product_repository.dart';
import 'package:get_healt_2/modules/products/controllers/product_detail_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // Buat satu repository untuk dipakai bersama
    Get.lazyPut<ProductRepository>(() => ProductRepository());

    // Controller untuk setiap halaman
    // Get.lazyPut<ProductListController>(() => ProductListController());
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
  }
}
