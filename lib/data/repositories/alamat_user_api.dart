import 'dart:convert';

import 'package:get_healt/util/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/alamat_user_model.dart';

Future<AlamatUserModel> fetchAlamatList() async {
  Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getString('id_user') ?? "4";
    return idUser;
  }

  String myData = await getId();

  final response = await http.get(Uri.parse(ApiEndpoint.alamatUser + myData));

  if (response.statusCode == 200) {
    var jsonData = json.decode(response.body);

    return AlamatUserModel.fromJson(jsonData);
  } else {
    throw Exception('Failed to load produk list');
  }
}
