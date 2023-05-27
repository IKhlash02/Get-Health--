import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/models/product_model.dart';
import '../data/repositories/product_kategori.dart';
import '../util/api_endpoint.dart';
import '../util/colors.dart';
import '../widget/search_button.dart';
import 'detail_page.dart';

class KategoriPage extends StatefulWidget {
  final int nomor;
  const KategoriPage({super.key, required this.nomor});

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  late Future<List<Produk>> _futureProdukList;

  @override
  void initState() {
    super.initState();
    _futureProdukList = fetchKategoriList(widget.nomor);
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
              Row(
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
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 18,
                    ),
                  ),
                  Expanded(child: SearchBar()),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ]),
              )
            ],
          ),
        ),
      ),
    ));
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
