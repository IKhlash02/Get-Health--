import 'dart:convert';

import 'package:get_healt_2/data/providers/network/api_endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/alamat_user_model.dart';
import '../models/user_model.dart';

Future<List<dynamic>> fetchAlamatList() async {
  Future<String> getId() async {
    final prefs = await SharedPreferences.getInstance();
    final idUser = prefs.getString('id_user') ?? "4";
    return idUser;
  }

  String myData = await getId();

  final response1 = await http.get(Uri.parse(ApiEndPoints.alamatUser + myData));
  final response2 = await http.get(Uri.parse(ApiEndPoints.userSatu + myData));

  if (response1.statusCode == 200 && response2.statusCode == 200) {
    var jsonData1 = json.decode(response1.body);
    var jsonData2 = json.decode(response2.body);

    AddressModel alamatList = AddressModel.fromJson(jsonData1);
    UserModel userList = UserModel.fromJson(jsonData2);

    return [alamatList, userList];
  } else {
    throw Exception('Failed to load produk list');
  }
}
