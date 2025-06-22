import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/data/models/product_model.dart';
import 'package:get_healt_2/modules/home/controllers/home_controller.dart';
import 'package:get_healt_2/widget/custom_search_bar.dart';
import 'package:get_healt_2/widget/product_card.dart';

import 'package:google_fonts/google_fonts.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.errorMessage.value.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }

          return SafeArea(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomSearchBar(
                        hintText: "Cari nama produk atau gejala...",
                        onSubmitted: (query) =>
                            controller.goToSearchPage(query)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        _buildSectionHeader(
                          context,
                          title: "Kategori",
                          onSeeAll: controller.seeAllCategories,
                        ),
                        _buildCategoryList(),
                        const SizedBox(height: 24),
                        _buildSectionHeader(context, title: "Terlaris"),
                        _buildBestSellingGrid(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }

  Widget _buildSectionHeader(BuildContext context,
      {required String title, VoidCallback? onSeeAll}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          if (onSeeAll != null)
            InkWell(
              onTap: onSeeAll,
              child: const Row(
                children: [
                  Text("Lihat Semua",
                      style: TextStyle(color: AppColors.primaryColor)),
                  Icon(Icons.navigate_next, color: AppColors.primaryColor),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return GestureDetector(
            onTap: () => controller.goToCategoryPage(category),
            child: Container(
              width: 90,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Image.asset(category.imageAsset,
                      height: 70, fit: BoxFit.contain),
                  const SizedBox(height: 8),
                  Text(
                    category.title,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Get.textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget untuk grid produk terlaris
  Widget _buildBestSellingGrid() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65, // Sesuaikan rasio agar pas
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: controller.bestSellingProducts.length,
      itemBuilder: (context, index) {
        final product = controller.bestSellingProducts[index];
        // Gunakan widget ProductCard yang sudah dibuat
        return ProductCard(
          product: product,
          onTap: () => controller.goToProductDetail(product),
        );
      },
    );
  }
}
