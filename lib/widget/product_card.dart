import 'package:flutter/material.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/data/models/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  final String heroTag;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.heroTag = 'product_image',
  });

  @override
  Widget build(BuildContext context) {
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
}
