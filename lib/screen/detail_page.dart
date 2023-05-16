import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_healt/screen/detail_review_page.dart';
import 'package:get_healt/util/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/models/product_model.dart';
import '../widget/read_more.dart';
import '../widget/review_item.dart';
import 'navbar_button.dart';

class DetailPage extends StatefulWidget {
  final Produk produk;

  DetailPage({super.key, required this.produk});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kotakColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: primerColor,
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
              child: Image.network(
                "http://192.168.0.105/get_healt/gethealthplus/${widget.produk.gambar}",
                fit: BoxFit.fitWidth,
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
                      widget.produk.namaProduk,
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
                        'Rp. ${widget.produk.hargaProduk}',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(
                          '/${widget.produk.jenisSatuan}',
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
                        initialRating: 4.5,
                        minRating: 0,
                        maxRating: 5,
                        itemSize: 25,
                        itemCount: 5,
                        allowHalfRating: true,
                        onRatingUpdate: (value) {},
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
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        "73 terjual",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12.73,
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
                    deskripsi: widget.produk.deskripsiProduk,
                    indikasi: widget.produk.indikasi,
                    isReadmore: isExpanded,
                    aturanPakai: widget.produk.aturanPakai,
                    efekSamping: widget.produk.efekSamping,
                    komposisi: widget.produk.komposisi,
                    kontraindikasi: widget.produk.kontraindikasi.isEmpty
                        ? "Tidak ada kontraindikasi pada produk ini"
                        : widget.produk.kontraindikasi,
                    perhatian: widget.produk.peringatanPerhatian,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          (isExpanded)
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: aksenColor,
                          size: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            "Lihat Selangkapnya",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: tulisanColor),
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
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
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
                            ?.copyWith(color: tulisanColor),
                      ),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext ctx) {
                                return const DetailReview();
                              });
                        },
                        child: Text(
                          "Lihat Semua Ulasan",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: tulisanColor),
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
                        "4.5/5",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: tulisanColor),
                      ),
                      Text(
                        "(12 ulasan)",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: tulisanColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const ReviewItem(),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.account_circle_rounded,
                    color: aksenColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Bianca",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: tulisanColor),
                          ),
                        ),
                        Text(
                          "Dramaga Bogor",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: tulisanColor,
                                  fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        backgroundColor: primerColor,
                        padding: const EdgeInsets.all(18)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavbarButton(),
                          ));
                    },
                    child: const Center(
                      child: Text(
                        "Kunjungi Toko",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    color: primerColor,
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
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    color: primerColor,
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
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.all(10),
                    color: primerColor,
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
