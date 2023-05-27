import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_healt/util/api_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UlasanController extends GetxController {
  final TextEditingController reviewController = TextEditingController();
  String rating = "0";

  Future<void> tambahUlasan(String idProduk, String idPesanan) async {
    Future<String> getId() async {
      final prefs = await SharedPreferences.getInstance();
      final idUser = prefs.getString('id_user') ?? "4";
      return idUser;
    }

    String myData = await getId();

    try {
      final response = await http.post(
          Uri.parse(
            ApiEndpoint.tambahUlasan,
          ),
          body: {
            'id_produk': idProduk,
            'id_user': myData,
            'id_pesanan': idPesanan,
            'rating': rating,
            'review': reviewController.text
          });

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == "success") {
          Get.back();
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              elevation: 0.5,
              backgroundColor: Colors.black12,
              content: Text('Ulasan Berhasil Ditambahkan'),
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
              title: const Text("Error"),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
