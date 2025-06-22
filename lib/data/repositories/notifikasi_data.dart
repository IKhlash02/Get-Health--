import 'dart:convert';
import 'package:get_healt_2/util/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/notifikasi_models.dart';

Future<List<Notifikasi>> fetchNotifikasi() async {
  Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getString('id_user') ?? "5";
    return idUser;
  }

  String myData = await getId();
  final response = await http.get(Uri.parse(ApiEndpoint.notifikasi + myData));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    if (jsonData.isNotEmpty) {
      List<Notifikasi> produkList =
          jsonData.map((data) => Notifikasi.fromJson(data)).toList();
      return produkList;
    } else {
      throw Exception('Tidak ada Notifikasi');
    }
  } else {
    throw Exception('Failed to load produk list');
  }
}
