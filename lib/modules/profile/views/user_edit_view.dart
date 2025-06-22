import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/modules/profile/controllers/edit_user_controller.dart';

import 'package:get_healt_2/widget/submit_button.dart';

import '../../../widget/button_login.dart';
import '../../../widget/text_norma.dart';

class UserEditView extends GetView<EditUserController> {
  const UserEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.west_outlined,
              color: AppColors.accentColor,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Edit Data Diri",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: AppColors.primaryColor),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Row(
                        children: [
                          TextNormal(
                            text: "Nama Penerima",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonLogin(
                        hinText: "XXXXX",
                        controller: controller.nameController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Row(
                        children: [TextSmall(text: "Maksimal 20 karakter")],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          TextNormal(
                            text: "Alamat Email",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonLogin(
                        hinText: "adsdad@email.com",
                        controller: controller.emailController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          TextNormal(
                            text: "Nomor Telephon",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonLogin(
                        hinText: "XXXXX",
                        controller: controller.phoneUserController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          TextNormal(
                            text: "Kata Sandi",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonLogin(
                        hinText: "******",
                        controller: controller.passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Row(
                        children: [TextSmall(text: "Maksimal 16 karakter")],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SubmitButton(
                  text: "Simpan",
                  onPressed: controller.saveChanges,
                ),
              ],
            ),
          ),
        ));
  }
}
