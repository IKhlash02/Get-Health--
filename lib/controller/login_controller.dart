import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_healt/screen/navbar_button.dart';
import 'package:get_healt/util/api_endpoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'id_provinsi.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefers = SharedPreferences.getInstance();

  Future<void> loginUser() async {
    try {
      final response = await http.post(
          Uri.parse(
            ApiEndpoint.formLogin,
          ),
          body: {
            "email_user": emailController.text.trim(),
            "password_user": passwordController.text.trim()
          });

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (data['value'] == 1) {
          var idUser = data['id_user'];
          final SharedPreferences prefs = await _prefers;

          await prefs.setString('id_user', idUser);
          emailController.clear();
          passwordController.clear();
          Get.off(const NavbarButton());
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
