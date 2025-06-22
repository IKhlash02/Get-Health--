import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../controller/pesanan_langsung.dart';

import '../data/models/alamat_user_model.dart';

import '../data/models/product_model.dart';
import '../data/repositories/alamat_user_api.dart';

class CheckoutLangsungPage extends StatefulWidget {
  final ProductModel produk;
  final String jumlah;
  const CheckoutLangsungPage(
      {super.key, required this.produk, required this.jumlah});

  @override
  State<CheckoutLangsungPage> createState() => _CheckoutLangsungPageState();
}

class _CheckoutLangsungPageState extends State<CheckoutLangsungPage> {
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
                      color: AppColors.primaryColor,
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
                                color: AppColors.textColor),
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
                        color: AppColors.textColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: _futureAlamatList,
                    builder: (context, snapshot) {
                      AddressModel? alamatList = snapshot.data?[0];
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
                              color: AppColors.boxColor,
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
                                    color: AppColors.textColor),
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
                                    color: AppColors.textColor),
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
                                    color: AppColors.textColor),
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
                                    color: AppColors.textColor),
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
                                    color: AppColors.textColor),
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
                                    color: AppColors.textColor),
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
                                    color: AppColors.textColor),
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
                        color: AppColors.textColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppColors.boxColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Expanded(
                        child: Column(
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
                                  "",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.produk.namaProduk,
                                        style: GoogleFonts.plusJakartaSans(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.5,
                                            color: AppColors.textColor)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "Rp${int.parse(widget.produk.hargaProduk) * int.parse(widget.jumlah)}",
                                          style: GoogleFonts.plusJakartaSans(
                                              fontSize: 9.72,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 0.5,
                                              color: AppColors.textColor)),
                                      TextSpan(
                                          text:
                                              "(${widget.jumlah} ${widget.produk.jenisSatuan} x Rp${widget.produk.hargaProduk})",
                                          style: GoogleFonts.plusJakartaSans(
                                              fontSize: 9.72,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.5,
                                              color: AppColors.textColor))
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
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Divider(
                            height: 10,
                            thickness: 2,
                            color: Color(0xffA1D1E0),
                          ),
                        )
                      ],
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
                        color: AppColors.accentColor,
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
                              color: AppColors.textColor))
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
                            color: AppColors.textColor),
                      ),
                      Text(
                        "Rp${formatter.format(int.parse(widget.produk.hargaProduk) * int.parse(widget.jumlah))}",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.76,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25,
                            color: AppColors.textColor),
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
                            color: AppColors.textColor),
                      ),
                      Text(
                        "Rp10.000",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.76,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25,
                            color: AppColors.textColor),
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
                            color: AppColors.textColor),
                      ),
                      Text(
                        "Rp1000",
                        style: GoogleFonts.plusJakartaSans(
                            fontSize: 15.76,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.25,
                            color: AppColors.textColor),
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
                                      color: AppColors.textColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Rp${int.parse(widget.produk.hargaProduk) * int.parse(widget.jumlah) + 10000 + 1000}",
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 26.24,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5,
                                      color: AppColors.textColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          pesananLangsung(
                              widget.jumlah, widget.produk.idProduk);
                        },
                        child: Container(
                          width: 145,
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
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
