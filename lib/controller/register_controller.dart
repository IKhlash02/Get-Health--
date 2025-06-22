import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_healt_2/util/api_endpoint.dart';

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
  File? imageFile;

  Future<void> registerUser() async {
    try {
      final request = await http.MultipartRequest(
          'POST',
          Uri.parse(
            ApiEndpoint.formRegister,
          ));
      request.fields.addAll({
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
        'detail_alamat': detailAlamatController.text,
      });

      if (imageFile != null) {
        List<int> imageBytes = await imageFile!.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        request.fields['gambar'] = base64Image;
      }

      http.StreamedResponse response = await request.send();
      final responseData = await response.stream.bytesToString();

      final data = jsonDecode(responseData);

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
          imageFile = null;
          Get.to(const SuccesRegister());
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
