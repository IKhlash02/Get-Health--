import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_healt/screen/detail_review_page.dart';
import 'package:get_healt/util/colors.dart';

import '../widget/read_more.dart';
import '../widget/review_item.dart';
import 'navbar_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

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
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              color: Colors.white,
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
                      "Panadol Paracetamol",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: tulisanColor),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Rp. 16.000",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: tulisanColor),
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
                      Text(
                        "73 terjual",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: tulisanColor),
                      ),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Deskripsi",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: tulisanColor),
                    ),
                  ),
                  BuildText(
                    text:
                        "Panadol adalah obat yang digunakan untuk mengatasi rasa nyeri atau sakit seperti sakit kepala dan gigi. Panadol mengandung zat aktif paracetamol yang berkhasiat dalam menurunkan demam. Obat ini bekerja dengan menghambat pembentukan prostaglandin yakni senyawa yang memicu nyeri.Paracetamol umumnya digunakan sebagai kandungan obat penurun demam dan penghilang nyeri atau rasa sakit. Selain dalam sediaan tablet, bahan aktif ini juga tersedia dalam bentuk sirup, drop, atau suspensi.Tergolong obat bebas, Panadol Biru dapat diperoleh dan digunakan tanpa resep dokter.\nDetail Produk:\n• Kategori: Demam\n• Komposisi: Paracetamol 500 mg\n• Golongan: Obat bebas• Perlu resep: Tidak\n• Rute obat: Oral• Kemasan: 1 dos isi 10 blister x 10 kaplet",
                    isReadmore: isExpanded,
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
                        const Icon(
                          Icons.change_history_sharp,
                          color: aksenColor,
                          size: 15,
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
