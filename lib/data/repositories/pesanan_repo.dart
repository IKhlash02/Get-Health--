import 'dart:convert';
import 'package:get_healt/util/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/pesanan_model.dart';

Future<List<Pesanan>> fetchPesananList() async {
  Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getString('id_user') ?? "5";
    return idUser;
  }

  String myData = await getId();
  final response = await http.get(Uri.parse(ApiEndpoint.pesanan + myData));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);

    if (jsonData.isNotEmpty) {
      List<Pesanan> pesananList =
          jsonData.map((data) => Pesanan.fromJson(data)).toList();
      print(pesananList);
      return pesananList;
    } else {
      throw Exception('Produk Tidak ada');
    }
  } else {
    throw Exception('Failed to load produk list');
  }
}
