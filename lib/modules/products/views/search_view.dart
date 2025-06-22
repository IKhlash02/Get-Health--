import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/modules/products/controllers/search_controller.dart';
import 'package:get_healt_2/widget/custom_search_bar.dart';
import 'package:get_healt_2/widget/product_card.dart';

class SearchView extends GetView<ProductSearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 70.0,
          title: CustomSearchBar(
            hintText: "Cari nama produk atau gejala...",
            onSubmitted: (query) {
              controller.onSearchChanged(query);
            },
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.searchError.value.isNotEmpty) {
            return Center(
              child: Text(
                controller.searchError.value,
                textAlign: TextAlign.center,
                style: Get.textTheme.titleMedium
                    ?.copyWith(color: Colors.grey[600]),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
            itemCount: controller.searchResults.length,
            itemBuilder: (context, index) {
              final product = controller.searchResults[index];
              return ProductCard(
                  product: product,
                  onTap: () => controller.goToProductDetail(product));
            },
          );
        }));
  }
}
