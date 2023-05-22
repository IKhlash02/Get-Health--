import 'package:flutter/material.dart';

import 'package:get_healt/widget/search_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/models/product_model.dart';
import '../../data/repositories/product_api.dart';
import '../../util/api_endpoint.dart';
import '../../util/colors.dart';
import '../detail_page.dart';

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
                      height: 85,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 76,
                              width: 76,
                              child: InkWell(
                                onTap: () {},
                                child: const Placeholder(),
                              ),
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
                              "CABANG DI DAERAHMU",
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
                      height: 65,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 40,
                              width: 150,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: const EdgeInsets.all(0),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                      color: kotakColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.home,
                                        color: primerColor,
                                        size: 20,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text("GetHealth+ Dramaga Bogor",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
                              itemCount: produkList?.length,
                              itemBuilder: (BuildContext context, int index) {
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
                child: Image.network("${ApiEndpoint.baseUrl}${produk.gambar}"),
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
                      "Cab. Dramaga Bogor",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
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
                      "Stok tersedia",
                      style: GoogleFonts.plusJakartaSans(
                          fontSize: 12.7,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: const Color(0xff6BBD44)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}
