import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/core/values/app_colors.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../controller/delete_controller.dart';
import '../../data/models/keranjang_model.dart';
import '../../data/repositories/keranjang_repo.dart';

import '../../util/api_endpoint.dart';
import '../checkout.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  late Future<Keranjang?> _futureKeranjangList;

  @override
  Widget build(BuildContext context) {
    _futureKeranjangList = fetchkeranjangList();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: FutureBuilder<Keranjang?>(
                future: _futureKeranjangList,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    Keranjang? keranjangList = snapshot.data;
                    List<Datum> dataKeranjang = keranjangList!.data;

                    return ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("KERANJANG SAYA",
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text(
                                "(${dataKeranjang.length})",
                                style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.15,
                                    color: AppColors.textColor),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dataKeranjang.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 5.0, top: 5),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10.0),
                                      child: Divider(
                                        height: 10,
                                        thickness: 2,
                                        color: Color(0xffA1D1E0),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 70,
                                          width: 70,
                                          color: Colors.white,
                                          child: Image.network(
                                            "${ApiEndpoint.baseUrl}${dataKeranjang[index].gambar}",
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.all(0),
                                            padding: const EdgeInsets.all(5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        dataKeranjang[index]
                                                            .namaProduk,
                                                        style: GoogleFonts
                                                            .plusJakartaSans(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                letterSpacing:
                                                                    1.25,
                                                                color: AppColors
                                                                    .textColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 1,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "jumlah: ${dataKeranjang[index].jumlah}",
                                                      style: GoogleFonts
                                                          .plusJakartaSans(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              letterSpacing:
                                                                  1.25,
                                                              color: AppColors
                                                                  .textColor),
                                                    ),
                                                    const Spacer(
                                                      flex: 1,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Rp. ${dataKeranjang[index].totalHarga}",
                                                          style: GoogleFonts
                                                              .plusJakartaSans(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            letterSpacing: 1.5,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 15,
                                                        ),
                                                        IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              deleteKeranjang(
                                                                  dataKeranjang[
                                                                          index]
                                                                      .idProduk);
                                                            });
                                                          },
                                                          icon: const Icon(
                                                            Icons.delete,
                                                            size: 18,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(
                                                      flex: 1,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                color: AppColors.boxColor,
                                borderRadius: BorderRadius.circular(11)),
                            child: Row(
                              children: [
                                Text(
                                  "Total:",
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 14.73,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.25,
                                      color: AppColors.textColor),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    "Rp. ${keranjangList.total}",
                                    style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14.73,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1.25,
                                        color: AppColors.textColor),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(ChackOutPage(
                                      keranjangList: keranjangList,
                                      dataKeranjang: dataKeranjang,
                                    ));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: AppColors.accentColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      "Checkout",
                                      style: GoogleFonts.plusJakartaSans(
                                          fontSize: 12.73,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1.25,
                                          color: Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
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
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("KERANJANG SAYA",
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(
                          "(0)",
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.15,
                              color: AppColors.textColor),
                        ),
                      ],
                    ),
                  );
                }))),
      ),
    );
  }
}
