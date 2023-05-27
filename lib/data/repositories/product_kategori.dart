import 'dart:convert';
import 'package:get_healt/util/api_endpoint.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

Future<List<Produk>> fetchKategoriList(int index) async {
  final response =
      await http.get(Uri.parse(ApiEndpoint.produkKategori + index.toString()));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    List<Produk> produkList =
        jsonData.map((data) => Produk.fromJson(data)).toList();
    return produkList;
  } else {
    throw Exception('Failed to load produk list');
  }
}
