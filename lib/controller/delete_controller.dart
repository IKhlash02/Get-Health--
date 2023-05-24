import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../screen/navbar_button.dart';
import '../util/api_endpoint.dart';

Future<void> deleteKeranjang(String idProduk) async {
  Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getString('id_user') ?? "5";
    return idUser;
  }

  String myData = await getId();
  final url =
      Uri.parse("${ApiEndpoint.delete_keranjang}$idProduk&id_user=$myData");
  final response = await http.delete(url);

  if (response.statusCode == 200) {}
}
