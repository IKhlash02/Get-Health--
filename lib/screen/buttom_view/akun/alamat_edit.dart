import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_healt/controller/register_controller.dart';

import 'package:get_healt/widget/dropdown.dart';
import 'package:get_healt/widget/submit_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/id_provinsi.dart';
import '../../../util/colors.dart';
import '../../../widget/button_login.dart';
import '../../../widget/dropdown_districk.dart';
import '../../../widget/dropdown_regency.dart';
import '../../../widget/dropdown_village.dart';
import '../../../widget/text_norma.dart';

class AlamatEdit extends StatefulWidget {
  const AlamatEdit({super.key});

  @override
  State<AlamatEdit> createState() => _AlamatEditState();
}

class _AlamatEditState extends State<AlamatEdit> {
  RegisterController registerController = Get.put(RegisterController());
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
                    "Edit Data Alamat",
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: const [
                          TextNormal(
                            text: "Nama ALamat",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonLogin(
                        hinText: "XXXXXXXX",
                        controller: registerController.namaAlamatController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                        hinText: "XXXXXXXX",
                        controller: registerController.penerimaAlamatController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          TextNormal(
                            text: "Nomor Telephone Penerima",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonLogin(
                        hinText: "XXXXXXXX",
                        controller: registerController.telpAlamatController,
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
                        onCustomWidgetCallback: (String data) {
                          registerController.provinsiAlamat = data;
                        },
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
                            onCustomWidgetCallback: (String data) {
                              registerController.kabupatenAlamat = data;
                            },
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
                      Obx(() => DropdownDistrict(
                            hinText: "Pilih Kecamatan",
                            message: "Pilih Kecamatanmu",
                            id: idProv.idKabupaten.toString(),
                            onCustomWidgetCallback: (String data) {
                              registerController.kecamatanAlamat = data;
                            },
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          TextNormal(
                            text: "Kelurahan",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() => DropdownVillage(
                            hinText: "Pilih Kelurahanmu",
                            message: "Pilih Kelurahanmu",
                            id: idProv.idKecamatan.toString(),
                            onCustomWidgetCallback: (String data) {
                              registerController.kelurahanAlamat = data;
                            },
                          )),
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
                      ButtonLogin(
                        hinText: "XXXX",
                        controller: registerController.kodePosAlamatController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          TextNormal(
                            text: "Detail Alamat",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonLogin(
                        hinText: "XXXXX",
                        controller: registerController.detailAlamatController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: const [
                          TextSmall(
                            text: "Nama jalan, nomor rumah, rincian tambahan",
                          )
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
                  onPressed: () => registerController.registerUser(),
                ),
              ],
            ),
          ),
        ));
  }
}
