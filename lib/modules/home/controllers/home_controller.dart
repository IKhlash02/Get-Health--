// lib/app/modules/home/controllers/home_controller.dart
import 'package:get/get.dart';
import 'package:get_healt_2/data/models/category_model.dart';
import 'package:get_healt_2/data/models/product_model.dart';
import 'package:get_healt_2/data/repositories/home_repository.dart';
import 'package:get_healt_2/routes/app_routes.dart';

class HomeController extends GetxController {
  final HomeRepository _repository = Get.find<HomeRepository>();

  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var bestSellingProducts = <ProductModel>[].obs;
  var categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomePageData();
  }

  Future<void> fetchHomePageData() async {
    try {
      isLoading(true);
      errorMessage('');

      final productFuture = _repository.getBestSellingProducts();
      final categoryFuture = _repository.getCategories();

      final products = await productFuture;

      bestSellingProducts.assignAll(products);
      categories.assignAll(categoryFuture);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void goToProductDetail(ProductModel product) {
    Get.toNamed(Routes.productDetail, arguments: product);
  }

  void goToCategoryPage(CategoryModel category) {
    Get.toNamed(Routes.categoryProduct,
        parameters: {'id': category.id.toString(), 'name': category.title});
  }

  void goToSearchPage(String query) {
    Get.toNamed(Routes.search, arguments: query);
  }

  void seeAllCategories() {
    Get.toNamed(Routes.categories);
  }
}
