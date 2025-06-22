import 'package:get/get.dart';
import 'package:get_healt_2/data/repositories/product_repository.dart';
import 'package:get_healt_2/modules/products/controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(() => ProductRepository(), fenix: true);
    Get.lazyPut<ProductSearchController>(() => ProductSearchController());
  }
}
