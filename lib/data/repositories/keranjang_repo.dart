import 'dart:convert';
import 'package:get_healt/util/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/keranjang_model.dart';

Future<Keranjang?> fetchkeranjangList() async {
  Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getString('id_user') ?? "5";
    return idUser;
  }

  String myData = await getId();

  final response = await http.get(Uri.parse(ApiEndpoint.keranjang + myData));

  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);

    if (jsonData["message"] == "Succes") {
      Keranjang keranjangList = Keranjang.fromJson(jsonData);
      return keranjangList;
    }
  } else {
    throw Exception('Failed to load produk list');
  }
  return null;
}
