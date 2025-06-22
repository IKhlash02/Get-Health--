import 'dart:convert';

import 'package:get_healt_2/screen/main_layout.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_healt_2/util/api_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditUserController extends GetxController {
  // final String userModel;

  // EditUserController(this.userModel);

  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController telpUserController = TextEditingController();

  Future<void> registerUser() async {
    Future<String> getId() async {
      final prefs = await SharedPreferences.getInstance();
      final idUser = prefs.getString('id_user') ?? "4";
      return idUser;
    }

    String myData = await getId();
    try {
      final response = await http.post(
          Uri.parse(
            ApiEndpoint.editUser + myData,
          ),
          body: {
            'nama_user': namaController.text.trim(),
            'email_user': emailController.text.trim(),
            'password_user': passwordController.text,
            'telp_user': telpUserController.text.trim(),
          });

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == "success") {
          namaController.clear();
          emailController.clear();
          passwordController.clear();
          passwordController.clear();
          telpUserController.clear();
          Get.to(MainLayout(
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
