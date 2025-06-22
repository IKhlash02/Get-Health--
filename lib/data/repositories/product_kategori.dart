import 'dart:convert';
import 'package:get_healt_2/util/api_endpoint.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

Future<List<ProductModel>> fetchKategoriList(int index) async {
  final response =
      await http.get(Uri.parse(ApiEndpoint.produkKategori + index.toString()));
  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);
    List<ProductModel> produkList =
        jsonData.map((data) => ProductModel.fromJson(data)).toList();
    return produkList;
  } else {
    throw Exception('Failed to load produk list');
  }
}
