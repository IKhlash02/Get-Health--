import 'dart:convert';
import 'package:get_healt_2/util/api_endpoint.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

Future<List<Produk>> fetchsearch(String search) async {
  if (search.isNotEmpty) {
    final response = await http
        .post(Uri.parse(ApiEndpoint.search), body: {'katakunci': search});

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      if (jsonData.isNotEmpty) {
        List<Produk> produkList =
            jsonData.map((data) => Produk.fromJson(data)).toList();
        return produkList;
      } else {
        throw Exception('Produk tidak ditemukan');
      }
    } else {
      throw Exception('Failed to load produk list');
    }
  } else {
    throw Exception('Silakan masukan kata kunci pencarian');
  }
}
