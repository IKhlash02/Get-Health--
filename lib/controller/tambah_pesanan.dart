import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/screen/main_layout.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../data/models/keranjang_model.dart';

Future<void> tambahPesanan(List<Datum> dataKeranjang) async {
  List<String> produkPesanan = [];
  List<String> jumlahPesanan = [];

  for (var i = 0; i < dataKeranjang.length; i++) {
    produkPesanan.add(dataKeranjang[i].idProduk);
    jumlahPesanan.add(dataKeranjang[i].jumlah);
  }

  Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getString('id_user') ?? "4";
    return idUser;
  }

  Future<String> getAlamat() async {
    final prefs = await SharedPreferences.getInstance();
    final idAlamat = prefs.getString('id_alamat') ?? "22";
    return idAlamat;
  }

  String myData = await getId();
  String idAlamat = await getAlamat();
  final Map<String, dynamic> requestData = {
    "id_user": myData,
    "id_alamat": idAlamat,
    "produk_pesanan": produkPesanan,
    "jumlah_produk": jumlahPesanan
  };
  try {
    final response = await http.post(Uri.parse(" ApiEndpoint.tambahPesan,"),
        body: jsonEncode(requestData));

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (data['status'] == "success") {
        Get.to(MainLayout(
          selectedNavbar: 3,
        ));
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            elevation: 0.5,
            backgroundColor: Colors.black12,
            content: Text('Pesanan Sedang Diproses'),
          ),
        );
      } else {
        throw data["message"] ?? "uknown error";
      }
    } else {
      throw data["message"] ?? "uknown error";
    }
  } catch (e) {
    // handle error message here

    Get.back();

    showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Message"),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        });
  }
}
