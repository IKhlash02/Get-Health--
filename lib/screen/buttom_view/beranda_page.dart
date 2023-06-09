import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_healt/widget/search_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/kategori_obat.dart';
import '../../data/models/product_model.dart';
import '../../data/repositories/product_api.dart';
import '../../util/api_endpoint.dart';
import '../../util/colors.dart';
import '../detail_page.dart';
import '../kategori_page.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  late Future<List<Produk>> _futureProdukList;

  @override
  void initState() {
    super.initState();
    _futureProdukList = fetchProdukList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SearchBar(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  "Kategori",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: tulisanColor),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      "Lihat Semua",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: tulisanColor),
                                    ),
                                    const Icon(
                                      Icons.navigate_next,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 130,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: kategoriList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final gambar = kategoriList[index]['gambar']!;
                              final judul = kategoriList[index]['judul']!;

                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(KategoriPage(
                                      nomor: index + 1,
                                    ));
                                  },
                                  child: Column(children: [
                                    SizedBox(
                                        width: 75,
                                        height: 78,
                                        child: Image.asset(gambar,
                                            fit: BoxFit.fitWidth)),
                                    Expanded(
                                      child: Text(
                                        judul,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.plusJakartaSans(
                                            fontSize: 11.87,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 0.5,
                                            color: tulisanColor),
                                      ),
                                    )
                                  ]),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    "Terlaris",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(color: tulisanColor),
                                  ),
                                ),
                              ]),
                        ),
                        FutureBuilder<List<Produk>>(
                            future: _futureProdukList,
                            builder: (context, snapshot) {
                              List<Produk>? produkList = snapshot.data;

                              if (snapshot.hasData) {
                                return GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 153 / 278),
                                  itemCount: 10,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _productBeranda(
                                        context, produkList![index]);
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ));
                              }
                              return const Text("");
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

Widget _productBeranda(BuildContext context, Produk produk) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  produk: produk,
                ),
              ));
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: kotakColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(2),
                height: 164,
                width: 154,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14)),
                ),
                child: Hero(
                    tag: 'produk',
                    child: Image.network(
                        "${ApiEndpoint.baseUrl}${produk.gambar}")),
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
                      produk.namaProduk,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: tulisanColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Rp  ${produk.hargaProduk}",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          color: tulisanColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      (produk.jumlahStok == "0")
                          ? "Stok habis"
                          : "Stok tersedia",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 12.7,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: Color((produk.jumlahStok == "0")
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
