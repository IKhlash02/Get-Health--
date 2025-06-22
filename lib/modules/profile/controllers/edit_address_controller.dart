import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/data/models/alamat_user_model.dart';
import 'package:get_healt_2/data/repositories/profile_repository.dart';

class EditAddressController extends GetxController {
  final ProfileRepository _repository = Get.find<ProfileRepository>();
  late final AddressModel initialAddress;

  // --- TEXT EDITING CONTROLLERS ---
  final nameAddresController = TextEditingController();
  final recipientNameController = TextEditingController();
  final phoneController = TextEditingController();
  final detailAddressController = TextEditingController();
  final postalCodeController = TextEditingController();

  // --- STATE ---
  var isSaving = false.obs;

  @override
  void onInit() {
    super.onInit();
    initialAddress = Get.arguments as AddressModel;
    nameAddresController.text = initialAddress.namaAlamat;
    recipientNameController.text = initialAddress.penerimaAlamat;
    phoneController.text = initialAddress.telpAlamat;
    detailAddressController.text = initialAddress.detailAlamat;
    postalCodeController.text = initialAddress.kodeposAlamat;
  }

  Future<void> saveChanges() async {
    try {
      isSaving(true);
      final updatedAddress = initialAddress.copyWith(
        // Perlu method copyWith di model
        namaAlamat: nameAddresController.text,
        penerimaAlamat: recipientNameController.text,
        telpAlamat: phoneController.text,
        detailAlamat: detailAddressController.text,
        kodeposAlamat: postalCodeController.text,
      );
      await _repository.updateAddress(updatedAddress);
      Get.back();
      Get.snackbar('Berhasil', 'Alamat berhasil diperbarui');
    } catch (e) {
      Get.snackbar('Gagal', e.toString());
    } finally {
      isSaving(false);
    }
  }

  @override
  void onClose() {
    recipientNameController.dispose();
    phoneController.dispose();
    detailAddressController.dispose();
    postalCodeController.dispose();
    super.onClose();
  }
}
