import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/data/models/product_model.dart';
import 'package:get_healt_2/modules/home/controllers/home_controller.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../util/api_endpoint.dart';

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
                  const SearchBar(),
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
        return productCard(
          product: product,
          onTap: () => controller.goToProductDetail(product),
        );
      },
    );
  }
}

Widget productCard(
    {required ProductModel product, required VoidCallback onTap}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.boxColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Hero(
                    tag: 'produk',
                    child: Image.network(
                      height: 150,
                      width: double.infinity,
                      product.gambar,
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.namaProduk,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: AppColors.textColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Rp  ${product.hargaProduk}",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          color: AppColors.textColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      (product.jumlahStok == "0")
                          ? "Stok habis"
                          : "Stok tersedia",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 12.7,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: Color((product.jumlahStok == "0")
                              ? 0xffCF6847
                              : 0xff6BBD44)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}
