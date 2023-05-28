import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get_healt/widget/submit_button.dart';

import '../../../controller/edit_user_controller.dart';
import '../../../data/models/user_model.dart';
import '../../../util/colors.dart';
import '../../../widget/button_login.dart';
import '../../../widget/text_norma.dart';

class UserEdit extends StatefulWidget {
  final UserModel userList;
  const UserEdit({super.key, required this.userList});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  EditUserController editUserController = Get.put(EditUserController());

  @override
  Widget build(BuildContext context) {
    editUserController.emailController =
        TextEditingController(text: widget.userList.emailUser);
    editUserController.namaController =
        TextEditingController(text: widget.userList.namaUser);
    editUserController.passwordController =
        TextEditingController(text: widget.userList.passwordUser);
    editUserController.telpUserController =
        TextEditingController(text: widget.userList.telpUser);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.west_outlined,
              color: aksenColor,
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
                        ?.copyWith(color: primerColor),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: const [
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
                        controller: editUserController.namaController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: const [
                          TextSmall(text: "Maksimal 20 karakter")
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
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
                        controller: editUserController.emailController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
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
                        controller: editUserController.telpUserController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
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
                        controller: editUserController.passwordController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: const [
                          TextSmall(text: "Maksimal 16 karakter")
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SubmitButton(
                  text: "Simpan",
                  onPressed: () => editUserController.registerUser(),
                ),
              ],
            ),
          ),
        ));
  }
}
