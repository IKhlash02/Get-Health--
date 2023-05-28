import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controller/tambah_pesanan.dart';
import '../data/models/alamat_user_model.dart';
import '../data/models/keranjang_model.dart';
import '../data/repositories/alamat_user_api.dart';
import '../util/api_endpoint.dart';
import '../util/colors.dart';

class ChackOutPage extends StatefulWidget {
  final Keranjang keranjangList;
  final List<Datum> dataKeranjang;
  const ChackOutPage(
      {super.key, required this.dataKeranjang, required this.keranjangList});

  @override
  State<ChackOutPage> createState() => _ChackOutPageState();
}

class _ChackOutPageState extends State<ChackOutPage> {
  late Future<List<dynamic>> _futureAlamatList;

  @override
  void initState() {
    super.initState();
    _futureAlamatList = fetchAlamatList();
  }

  var formatter = NumberFormat('#.###');
  String? idProduk;
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
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            "CHECKOUT",
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                                color: tulisanColor),
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
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Data Alamat",
                    style: GoogleFonts.montserrat(
                        fontSize: 16.6,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        color: tulisanColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: _futureAlamatList,
                    builder: (context, snapshot) {
                      AlamatUserModel? alamatList = snapshot.data?[0];
                      idProduk = alamatList?.idAlamat;
                      if (snapshot.hasData) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 0,
                          ),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          decoration: BoxDecoration(
                              color: kotakColor,
                              borderRadius: BorderRadius.circular(12.47)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                alamatList!.penerimaAlamat,
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14.64,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.5,
                                    color: tulisanColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                alamatList.telpAlamat,
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14.64,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                    color: tulisanColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                alamatList.provinsiAlamat,
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14.64,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                    color: tulisanColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Kab. ${alamatList.kabkotAlamat}",
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14.64,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                    color: tulisanColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Kec. ${alamatList.kecAlamat}",
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14.64,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                    color: tulisanColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                alamatList.kodeposAlamat,
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14.64,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                    color: tulisanColor),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                alamatList.detailAlamat,
                                style: GoogleFonts.plusJakartaSans(
                                    fontSize: 14.64,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.5,
                                    color: tulisanColor),
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox(
                        height: 0,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Daftar Pesanan",
                    style: GoogleFonts.montserrat(
                        fontSize: 16.6,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        color: tulisanColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: kotakColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Expanded(
                        child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
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
                                      "${ApiEndpoint.baseUrl}${widget.dataKeranjang[index].gambar}",
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
                                        Text(
                                            widget.dataKeranjang[index]
                                                .namaProduk,
                                            style: GoogleFonts.plusJakartaSans(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                letterSpacing: 0.5,
                                                color: tulisanColor)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text:
                                                  "Rp${widget.dataKeranjang[index].totalHarga}",
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      fontSize: 9.72,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      letterSpacing: 0.5,
                                                      color: tulisanColor)),
                                          TextSpan(
                                              text:
                                                  "(${widget.dataKeranjang[index].jumlah} ${widget.dataKeranjang[index].jenisSatuan} x Rp${int.parse(widget.dataKeranjang[index].totalHarga) / int.parse(widget.dataKeranjang[index].jumlah)})",
                                              style:
                                                  GoogleFonts.plusJakartaSans(
                                                      fontSize: 9.72,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      letterSpacing: 0.5,
                                                      color: tulisanColor))
                                        ])),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            (index != widget.dataKeranjang.length - 1)
                                ? const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Divider(
                                      height: 10,
                                      thickness: 2,
                                      color: Color(0xffA1D1E0),
                                    ),
                                  )
                                : const SizedBox(
                                    height: 0,
                                  )
                          ],
                        );
                      },
                      itemCount: widget.dataKeranjang.length,
                    )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.receipt_long_outlined,
                        color: aksenColor,
                        size: 33,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("Rincian Pembayaran",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.5,
                              color: tulisanColor))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Subtotal untuk Produk",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.76,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25,
                            color: tulisanColor),
                      ),
                      Text(
                        "Rp${formatter.format(widget.keranjangList.total)}",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.76,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25,
                            color: tulisanColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Subtotal Pengiriman",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.76,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25,
                            color: tulisanColor),
                      ),
                      Text(
                        "Rp10.000",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.76,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25,
                            color: tulisanColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Biaya Layanan",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.76,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25,
                            color: tulisanColor),
                      ),
                      Text(
                        "Rp1000",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.76,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25,
                            color: tulisanColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Total Pesanan:",
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5,
                                      color: tulisanColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Rp${widget.keranjangList.total + 10000 + 1000}",
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 26.24,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5,
                                      color: tulisanColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          tambahPesanan(widget.dataKeranjang);
                        },
                        child: Container(
                          width: 145,
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          decoration: BoxDecoration(
                              color: primerColor,
                              borderRadius: BorderRadius.circular(13.49)),
                          child: Center(
                            child: Text(
                              "Buat Pesanan",
                              style: GoogleFonts.plusJakartaSans(
                                  fontSize: 16.24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
