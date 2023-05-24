import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../util/api_endpoint.dart';

Future<void> tambahKeranjang(int count, String idProduk) async {
  Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getString('id_user') ?? "4";
    return idUser;
  }

  String myData = await getId();
  try {
    final response = await http.post(
        Uri.parse(
          "${ApiEndpoint.tambahKeranjang}$idProduk&id_user=$myData",
        ),
        body: {'jumlah': count.toString()});

    final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (data['status'] == "success") {
        Get.back();
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            elevation: 0.5,
            backgroundColor: Colors.black12,
            content: Text('Dimasukkan ke Keranjang'),
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
