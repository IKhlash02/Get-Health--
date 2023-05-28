import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_healt/util/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/tambah_ulasan.dart';
import '../../../data/models/pesanan_model.dart';
import '../../../util/api_endpoint.dart';
import '../../../widget/submit_button.dart';

class UlasanItem extends StatefulWidget {
  final RincianPesanan pesanan;
  final Pesanan idPesanan;
  const UlasanItem({super.key, required this.pesanan, required this.idPesanan});

  @override
  State<UlasanItem> createState() => _UlasanItem();
}

class _UlasanItem extends State<UlasanItem> {
  UlasanController ulasanController = Get.put(UlasanController());
  double rating = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      margin: const EdgeInsets.all(0),
                      padding: const EdgeInsets.all(0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: primerColor,
                      ),
                      child: IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        iconSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              "Beri Ulasan",
                              style: GoogleFonts.montserrat(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.5,
                                  color: primerColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 32,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Container(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                          border: Border.all(color: kotakColor, width: 5),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18)),
                      child: Image.network(
                        "${ApiEndpoint.baseUrl}${widget.pesanan.gambar}",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      widget.pesanan.namaProduk,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RatingBar(
                      initialRating: 0,
                      minRating: 0,
                      maxRating: 5,
                      itemSize: 45,
                      itemCount: 5,
                      allowHalfRating: true,
                      onRatingUpdate: (value) {
                        ulasanController.rating = value.toString();
                      },
                      ratingWidget: RatingWidget(
                        full: const Icon(
                          Icons.star,
                          color: aksenColor,
                        ),
                        half: const Icon(
                          Icons.star_half_outlined,
                          color: aksenColor,
                        ),
                        empty: const Icon(
                          Icons.star_outline,
                          color: aksenColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    TextField(
                      controller: ulasanController.reviewController,
                      maxLines:
                          null, // Membuat TextField bisa mengisi lebih dari satu baris teks
                      keyboardType: TextInputType
                          .multiline, // Mengaktifkan keyboard dengan fitur multiline
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            bottom: 40.0, top: 8, right: 8, left: 8),
                        isDense: true,
                        hintText: 'Ketik ulasan anda..',
                        hintStyle: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                        ),
                        fillColor: kotakColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(12.47)),
                        // Tambahkan properti dekorasi lain yang Anda butuhkan
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    SubmitButton(
                      text: "Simpan",
                      onPressed: () {
                        ulasanController.tambahUlasan(widget.pesanan.idProduk,
                            widget.idPesanan.idPesanan);
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
