import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/modules/profile/controllers/edit_address_controller.dart';

import 'package:get_healt_2/widget/dropdown.dart';

import '../../../widget/button_login.dart';
import '../../../widget/dropdown_districk.dart';
import '../../../widget/dropdown_regency.dart';
import '../../../widget/dropdown_village.dart';
import '../../../widget/text_norma.dart';

class EditAddressView extends GetView<EditAddressController> {
  const EditAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          actions: [
            Obx(() => TextButton(
                  onPressed:
                      controller.isSaving.value ? null : controller.saveChanges,
                  child: controller.isSaving.value
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text("SIMPAN"),
                )),
          ],
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
                        ?.copyWith(color: AppColors.primaryColor),
                  ),
                ),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
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
                        controller: controller.detailAddressController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                        hinText: "XXXXXXXX",
                        controller: controller.recipientNameController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
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
                        controller: controller.phoneController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
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
                        onCustomWidgetCallback: (String data) {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
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
                            id: "",
                            onCustomWidgetCallback: (String data) {},
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
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
                            id: "",
                            onCustomWidgetCallback: (String data) {},
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
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
                            id: "",
                            onCustomWidgetCallback: (String data) {},
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
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
                        controller: controller.postalCodeController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
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
                        controller: controller.detailAddressController,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      const Row(
                        children: [
                          TextSmall(
                            text: "Nama jalan, nomor rumah, rincian tambahan",
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
