import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:get_healt/widget/dropdown.dart';
import 'package:get_healt/widget/submit_button.dart';

import '../../../controller/edit_alamat_controller.dart';
import '../../../controller/id_provinsi.dart';
import '../../../data/models/alamat_user_model.dart';
import '../../../util/colors.dart';
import '../../../widget/button_login.dart';
import '../../../widget/dropdown_districk.dart';
import '../../../widget/dropdown_regency.dart';
import '../../../widget/dropdown_village.dart';
import '../../../widget/text_norma.dart';

class AlamatEdit extends StatefulWidget {
  final AlamatUserModel alamatList;
  const AlamatEdit({super.key, required this.alamatList});

  @override
  State<AlamatEdit> createState() => _AlamatEditState();
}

class _AlamatEditState extends State<AlamatEdit> {
  EditAlamatController editAlamatController = Get.put(EditAlamatController());
  final idProv = Get.put(IdProvinsi());

  @override
  Widget build(BuildContext context) {
    editAlamatController.penerimaAlamatController =
        TextEditingController(text: widget.alamatList.penerimaAlamat);
    editAlamatController.namaAlamatController =
        TextEditingController(text: widget.alamatList.namaAlamat);
    editAlamatController.telpAlamatController =
        TextEditingController(text: widget.alamatList.telpAlamat);
    editAlamatController.kodePosAlamatController =
        TextEditingController(text: widget.alamatList.kodeposAlamat);
    editAlamatController.detailAlamatController =
        TextEditingController(text: widget.alamatList.detailAlamat);
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
                        controller: editAlamatController.namaAlamatController,
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
                        controller:
                            editAlamatController.penerimaAlamatController,
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
                        controller: editAlamatController.telpAlamatController,
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
                          editAlamatController.provinsiAlamat = data;
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
                              editAlamatController.kabupatenAlamat = data;
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
                              editAlamatController.kecamatanAlamat = data;
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
                              editAlamatController.kelurahanAlamat = data;
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
                        controller:
                            editAlamatController.kodePosAlamatController,
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
                        controller: editAlamatController.detailAlamatController,
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
                  onPressed: () => editAlamatController.editAlamatUser(),
                ),
              ],
            ),
          ),
        ));
  }
}
