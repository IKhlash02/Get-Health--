import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/data/models/user_model.dart';
import 'package:get_healt_2/data/repositories/profile_repository.dart';

class EditUserController extends GetxController {
  final ProfileRepository _repository = Get.find<ProfileRepository>();
  late final UserModel initialUser;

  // --- TEXT EDITING CONTROLLERS ---
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneUserController = TextEditingController();

  // --- STATE ---
  var isSaving = false.obs;

  @override
  void onInit() {
    super.onInit();
    initialUser = Get.arguments as UserModel;
    nameController.text = initialUser.namaUser;
    emailController.text = initialUser.emailUser;
    passwordController.text = initialUser.passwordUser;
    phoneUserController.text = initialUser.telpUser;
  }

  Future<void> saveChanges() async {
    try {
      isSaving(true);
      final updatedUser = initialUser.copyWith(
        // Perlu method copyWith di model
        emailUser: emailController.text,
        passwordUser: passwordController.text,
        namaUser: nameController.text,
        telpUser: phoneUserController.text,
      );
      await _repository.updateUser(updatedUser);
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
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    phoneUserController.dispose();
    super.onClose();
  }
}
