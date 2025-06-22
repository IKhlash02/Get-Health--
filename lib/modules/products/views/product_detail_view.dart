import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import 'package:get_healt_2/controller/tambah_keranjang.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/modules/products/controllers/product_detail_controller.dart';
import 'package:get_healt_2/screen/detail_review_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/launc_browser.dart';
import '../../../data/models/ulasan_model.dart';
import '../../../widget/read_more.dart';
import '../../../widget/review_item.dart';

import '../../../screen/checkout_langsung.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.boxColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.primaryColor,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.white,
              child: Hero(
                tag: 'produk',
                child: Image.network(
                  controller.product.gambar,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      controller.product.namaProduk,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Rp. ${controller.product.hargaProduk}',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          '/${controller.product.jenisSatuan}',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 11.89,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      RatingBar(
                        initialRating:
                            double.parse(controller.product.avgRating),
                        minRating: 0,
                        maxRating: 5,
                        itemSize: 25,
                        itemCount: 5,
                        allowHalfRating: true,
                        onRatingUpdate: (value) {},
                        ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: AppColors.accentColor,
                          ),
                          half: const Icon(
                            Icons.star_half_outlined,
                            color: AppColors.accentColor,
                          ),
                          empty: const Icon(
                            Icons.star_outline,
                            color: AppColors.accentColor,
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        maxLines: 2,
                        "stok ${controller.product.jumlahStok}",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 10.73,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildText(
                    deskripsi: controller.product.deskripsiProduk,
                    indikasi: controller.product.indikasi,
                    isReadmore: controller.isDescriptionExpanded.value,
                    aturanPakai: controller.product.aturanPakai,
                    efekSamping: controller.product.efekSamping,
                    komposisi: controller.product.komposisi,
                    kontraindikasi: controller.product.kontraindikasi.isEmpty
                        ? "Tidak ada kontraindikasi pada produk ini"
                        : controller.product.kontraindikasi,
                    perhatian: controller.product.peringatanPerhatian,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: controller.toggleDescription,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          (controller.isDescriptionExpanded.value)
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: AppColors.accentColor,
                          size: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            "Lihat Selangkapnya",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: AppColors.textColor),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildReviewSection(context),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    launchURLBrowser();
                  },
                  child: Expanded(
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(10),
                      color: AppColors.primaryColor,
                      child: const Center(
                        child: Text(
                          "Hubungi Penjual",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      int count = 1;
                      showDialog<void>(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder: (builder, setState) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: const Center(child: Text('Jumlah')),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 26.24,
                                    width: 23.62,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          side: const BorderSide(
                                              width: 0.5,
                                              color: AppColors.primaryColor),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.25)),
                                          padding: const EdgeInsets.all(0)),
                                      onPressed: () {
                                        if (count != 1) {
                                          setState(() {
                                            count--;
                                          });
                                        }
                                      },
                                      child: Center(
                                        child: Text(
                                          '-',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.plusJakartaSans(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.25,
                                              color: AppColors.textColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    count.toString(),
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 21,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.25,
                                        color: AppColors.textColor),
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    controller.product.jenisSatuan,
                                    style: GoogleFonts.plusJakartaSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    height: 26.24,
                                    width: 23.62,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: const BorderSide(
                                            width: 0.5,
                                            color: AppColors.primaryColor),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.25)),
                                        padding: const EdgeInsets.all(0),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          count++;
                                        });
                                      },
                                      child: Center(
                                        child: Text(
                                          '+',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.plusJakartaSans(
                                              fontSize: 21,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.25,
                                              color: AppColors.textColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                OverflowBar(
                                  alignment: MainAxisAlignment.center,
                                  children: [
                                    OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(
                                                color: AppColors.boxColor),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        13.28))),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "Batal",
                                          style: GoogleFonts.plusJakartaSans(
                                              fontSize: 13.55,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.5,
                                              color: AppColors.textColor),
                                        )),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor:
                                                AppColors.accentColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        13.28))),
                                        onPressed: () {
                                          tambahKeranjang(count,
                                              controller.product.idProduk);
                                        },
                                        child: Text(
                                          "Masukkan",
                                          style: GoogleFonts.plusJakartaSans(
                                              fontSize: 13.55,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.5,
                                              color: AppColors.textColor),
                                        )),
                                  ],
                                ),
                              ],
                            );
                          });
                        },
                      );
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(10),
                      color: AppColors.primaryColor,
                      child: const Center(
                        child: Text(
                          "Masukkan Ke Keranjang",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                InkWell(
                  onTap: () {
                    int count = 1;
                    showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (builder, setState) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: const Center(child: Text('Jumlah')),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 26.24,
                                  width: 23.62,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        side: const BorderSide(
                                            width: 0.5,
                                            color: AppColors.primaryColor),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.25)),
                                        padding: const EdgeInsets.all(0)),
                                    onPressed: () {
                                      if (count != 1) {
                                        setState(() {
                                          count--;
                                        });
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        '-',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.plusJakartaSans(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1.25,
                                            color: AppColors.textColor),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  count.toString(),
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.25,
                                      color: AppColors.textColor),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  controller.product.jenisSatuan,
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 26.24,
                                  width: 23.62,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 0.5,
                                          color: AppColors.primaryColor),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.25)),
                                      padding: const EdgeInsets.all(0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        count++;
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        '+',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.plusJakartaSans(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1.25,
                                            color: AppColors.textColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              OverflowBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                          side: const BorderSide(
                                              color: AppColors.boxColor),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      13.28))),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Batal",
                                        style: GoogleFonts.plusJakartaSans(
                                            fontSize: 13.55,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1.5,
                                            color: AppColors.textColor),
                                      )),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor:
                                              AppColors.accentColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      13.28))),
                                      onPressed: () {
                                        Get.to(CheckoutLangsungPage(
                                          produk: controller.product,
                                          jumlah: count.toString(),
                                        ));
                                      },
                                      child: Text(
                                        "Masukkan",
                                        style: GoogleFonts.plusJakartaSans(
                                            fontSize: 13.55,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 1.5,
                                            color: AppColors.textColor),
                                      )),
                                ],
                              ),
                            ],
                          );
                        });
                      },
                    );
                  },
                  child: Expanded(
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.all(10),
                      color: AppColors.primaryColor,
                      child: const Center(
                        child: Text(
                          "Beli Sekarang",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildReviewSection(BuildContext context) {
    return Obx(() {
      if (controller.isLoadingReviews.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.reviewsError.value.isNotEmpty) {
        return Center(child: Text(controller.reviewsError.value));
      }
      if (controller.reviews.isEmpty) {
        return const Center(child: Text("Belum ada ulasan untuk produk ini."));
      }

      List<ReviewModel>? ulasanList = controller.reviews;
      return Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ulasan",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: AppColors.textColor),
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext ctx) {
                          return DetailReview(
                            ulasanList: ulasanList,
                            averageRating:
                                controller.product.avgRating.toString(),
                          );
                        });
                  },
                  child: Text(
                    "Lihat Semua Ulasan",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.textColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "${double.parse(controller.product.avgRating)}/5",
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                      color: AppColors.textColor),
                ),
                Text(
                  "(12 ulasan)",
                  style: GoogleFonts.plusJakartaSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.5,
                      color: AppColors.textColor),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ReviewItem(
              date: ulasanList![0].timestamp.toString(),
              rating: ulasanList[0].rating,
              review: ulasanList[0].review,
              userName: ulasanList[0].userName,
            ),
          ],
        ),
      );
    });
  }
}
