import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_healt/util/api_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/navbar_button.dart';

class EditAlamatController extends GetxController {
  TextEditingController namaAlamatController = TextEditingController();
  TextEditingController penerimaAlamatController = TextEditingController();
  TextEditingController telpAlamatController = TextEditingController();
  TextEditingController kodePosAlamatController = TextEditingController();
  TextEditingController detailAlamatController = TextEditingController();
  String provinsiAlamat = 'jawa barat';
  String kabupatenAlamat = 'Bogor';
  String kecamatanAlamat = 'Dramaga';
  String kelurahanAlamat = 'Dramaga';

  Future<void> editAlamatUser() async {
    Future<String> getId() async {
      final prefs = await SharedPreferences.getInstance();
      final idUser = prefs.getString('id_user') ?? "4";
      return idUser;
    }

    String myData = await getId();
    try {
      final response = await http.post(
          Uri.parse(
            ApiEndpoint.editAlamat + myData,
          ),
          body: {
            'nama_alamat': namaAlamatController.text,
            'penerima_alamat': penerimaAlamatController.text,
            'telp_alamat': telpAlamatController.text,
            'provinsi_alamat': provinsiAlamat,
            'kabkot_alamat': kabupatenAlamat,
            'kec_alamat': kecamatanAlamat,
            'kel_alamat': kelurahanAlamat,
            'kodepos_alamat': kodePosAlamatController.text,
            'detail_alamat': detailAlamatController.text
          });

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == "success") {
          namaAlamatController.clear();
          penerimaAlamatController.clear();
          telpAlamatController.clear();
          kodePosAlamatController.clear();
          detailAlamatController.clear();
          Get.to(NavbarButton(
            selectedNavbar: 4,
          ));
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
              title: const Text("Error"),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
