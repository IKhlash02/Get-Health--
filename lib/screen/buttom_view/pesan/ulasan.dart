import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt/screen/buttom_view/pesan/ulasan_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/pesanan_model.dart';
import '../../../data/repositories/pesanan_repo.dart';
import '../../../util/api_endpoint.dart';
import '../../../util/colors.dart';

class UlasanPage extends StatefulWidget {
  const UlasanPage({
    super.key,
  });

  @override
  State<UlasanPage> createState() => _UlasanPageState();
}

class _UlasanPageState extends State<UlasanPage> {
  late Future<List<Pesanan>> _futurePesanan;

  @override
  void initState() {
    super.initState();
    _futurePesanan = fetchPesananList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futurePesanan,
        builder: (context, snapshot) {
          List<Pesanan>? pesananList = snapshot.data;

          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: pesananList?.length,
              itemBuilder: (context, index) {
                if (pesananList?[index].statusPesanan == "Selesai") {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: kotakColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.list_alt,
                                color: primerColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pesanan dibuat  pada",
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 12.73,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.5,
                                        color: tulisanColor),
                                  ),
                                  Text(
                                    pesananList![index]
                                        .tanggalPesanan
                                        .toString(),
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 12.73,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.5,
                                        color: tulisanColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Divider(
                            height: 10,
                            thickness: 2,
                            color: Color(0xffA1D1E0),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: pesananList[index].rincianPesanan.length,
                          itemBuilder: (BuildContext context, int nomor) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        color: Colors.white,
                                        child: Image.network(
                                          "${ApiEndpoint.baseUrl}${pesananList[index].rincianPesanan[nomor].gambar}",
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4,
                                                      horizontal: 8),
                                              decoration: BoxDecoration(
                                                color: const Color(0xff74B91D),
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                              ),
                                              child: Text(
                                                'pesanan Terverifikasi',
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        letterSpacing: 0.5,
                                                        color: Colors.white),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                pesananList[index]
                                                    .rincianPesanan[nomor]
                                                    .namaProduk,
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        letterSpacing: 0.5,
                                                        color: tulisanColor)),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      "Rp${pesananList[index].rincianPesanan[nomor].totalHarga}",
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                          fontSize: 9.72,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          letterSpacing: 0.5,
                                                          color: tulisanColor)),
                                              TextSpan(
                                                  text:
                                                      "(${pesananList[index].rincianPesanan[nomor].jumlahPesanan} ${pesananList[index].rincianPesanan[nomor].jenisSatuan} x ${pesananList[index].rincianPesanan[nomor].totalHarga / int.parse(pesananList[index].rincianPesanan[nomor].jumlahPesanan)})",
                                                  style: GoogleFonts
                                                      .plusJakartaSans(
                                                          fontSize: 9.72,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          letterSpacing: 0.5,
                                                          color: tulisanColor))
                                            ])),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              width: 110,
                                              child: Opacity(
                                                opacity: (pesananList[index]
                                                        .rincianPesanan[nomor]
                                                        .isUlasan)
                                                    ? 1.0
                                                    : 0.5,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.47))),
                                                  onPressed: () {
                                                    (pesananList[index]
                                                            .rincianPesanan[
                                                                nomor]
                                                            .isUlasan)
                                                        ? Get.to(UlasanItem(
                                                            pesanan: pesananList[
                                                                        index]
                                                                    .rincianPesanan[
                                                                nomor],
                                                            idPesanan:
                                                                pesananList[
                                                                    index],
                                                          ))
                                                        : ScaffoldMessenger.of(
                                                                Get.context!)
                                                            .showSnackBar(
                                                            const SnackBar(
                                                              elevation: 0.5,
                                                              backgroundColor:
                                                                  Colors
                                                                      .black12,
                                                              content: Text(
                                                                  'Anda Sudah Membuat Ulasan'),
                                                            ),
                                                          );
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        Icons.star,
                                                        color: Colors.white,
                                                        size: 12,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        'Beri Ulasan',
                                                        style: GoogleFonts
                                                            .plusJakartaSans(
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                letterSpacing:
                                                                    0.5,
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Divider(
                                    height: 10,
                                    thickness: 2,
                                    color: Color(0xffA1D1E0),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Total Pesanan:",
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 13.63,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.5,
                                        color: tulisanColor),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rp${pesananList[index].total}",
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 20.93,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 0.5,
                                        color: tulisanColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            ));
          }
          return const Center(
            child: Text("Tidak ada Pesanan yang dikirim"),
          );
        });
  }
}
