import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_healt/screen/navbar_button.dart';
import 'package:get_healt/util/api_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/succes_register.dart';

class RegisterController extends GetxController {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController telpUserController = TextEditingController();
  final TextEditingController namaAlamatController = TextEditingController();
  final TextEditingController penerimaAlamatController =
      TextEditingController();
  final TextEditingController telpAlamatController = TextEditingController();
  final TextEditingController kodePosAlamatController = TextEditingController();
  final TextEditingController detailAlamatController = TextEditingController();
  String provinsiAlamat = 'jawa barat';
  String kabupatenAlamat = 'Bogor';
  String kecamatanAlamat = 'Dramaga';
  String kelurahanAlamat = 'Dramaga';

  Future<void> registerUser() async {
    try {
      final response = await http.post(
          Uri.parse(
            ApiEndpoint.formRegister,
          ),
          body: {
            'nama_user': namaController.text.trim(),
            'email_user': emailController.text.trim(),
            'password_user': passwordController.text,
            'telp_user': telpUserController.text.trim(),
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
          namaController.clear();
          emailController.clear();
          passwordController.clear();
          passwordController.clear();
          telpUserController.clear();
          namaAlamatController.clear();
          penerimaAlamatController.clear();
          telpAlamatController.clear();
          kodePosAlamatController.clear();
          detailAlamatController.clear();
          Get.to(const SuccesRegister());
        } else {
          throw data["message"] ?? "uknown error";
        }
      } else {
        throw data["message"] ?? "uknown error";
      }
    } catch (e, s) {
      // handle error message here

      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text("Error"),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString() + s.toString())],
            );
          });
    }
  }
}
