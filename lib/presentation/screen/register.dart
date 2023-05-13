import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_healt/presentation/screen/succes_register.dart';
import 'package:get_healt/presentation/widget/dropdown.dart';

import '../../util/colors.dart';
import '../provider/id_provinsi.dart';
import '../widget/button_input.dart';
import '../widget/button_submit.dart';
import '../widget/dropdown_regency.dart';
import '../widget/text_norma.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final idProv = Get.put(IdProvinsi());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Registrasi Akun",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: primerColor),
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Data Pribadi",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: tulisanColor),
                        ),
                      ),
                      Row(
                        children: const [
                          TextNormal(
                            text: "Nama Lengkap",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ButtonInput(
                        hinText: "XXXXX",
                        message: "email tidak ada",
                        obscureText: false,
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
                      const ButtonInput(
                        hinText: "adsdad@email.com",
                        message: "password tidak ada",
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
                      const ButtonInput(
                        hinText: "XXXXX",
                        message: "email tidak ada",
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
                      const ButtonInput(
                        hinText: "******",
                        message: "password tidak ada",
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 20),
                        child: Text(
                          "Data Alamat",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: tulisanColor),
                        ),
                      ),
                      Row(
                        children: const [
                          TextNormal(
                            text: "Alamat Singkat",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ButtonInput(
                        hinText: "Jl. XXXXX No. XX",
                        message: "email tidak ada",
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          TextNormal(
                            text: "Provinsi",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropDown(
                        hinText: "Pilih Provinsi",
                        message: "Pilih Provinsimu",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          TextNormal(
                            text: "Kota/Kabupaten",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() => DropDownRegency(
                            hinText: "Pilih Kota/Kabupaten",
                            message: "Pilih Kabupatenmu",
                            id: idProv.idProv.toString(),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          TextNormal(
                            text: "Kecamatan",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ButtonInput(
                        hinText: "Pilih Kecamatan",
                        message: "password tidak ada",
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          TextNormal(
                            text: "Kode Pos",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ButtonInput(
                        hinText: "XXXX",
                        message: "password tidak ada",
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          TextNormal(
                            text: "Rincian Tambahan",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ButtonInput(
                        hinText: "XXXXX",
                        message: "password tidak ada",
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ButtonSubmit(
                  text: "Daftar",
                  route: SuccesRegister(),
                ),
              ],
            ),
          ),
        ));
  }
}
