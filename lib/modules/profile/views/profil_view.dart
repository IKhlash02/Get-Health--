import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/data/providers/network/api_endpoint.dart';
import 'package:get_healt_2/modules/profile/controllers/profile_controller.dart';
import 'package:get_healt_2/screen/buttom_view/akun/user_edit.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilView extends GetView<ProfileController> {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Profile Saya"),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.errorMessage.value.isNotEmpty) {
            return Center(child: Text(controller.errorMessage.value));
          }

          if (controller.user.value == null ||
              controller.address.value == null) {
            return const Center(child: Text("Data profil tidak dapat dimuat."));
          }

          final user = controller.user.value!;
          final address = controller.address.value!;

          return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      width: 95,
                      height: 95,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(
                          child: Image.network(
                        user.fotoUser,
                        fit: BoxFit.cover,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.namaUser,
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.25,
                        color: AppColors.textColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Data Diri",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.25,
                              color: AppColors.textColor),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(UserEdit(userList: user));
                          },
                          child: Container(
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 7),
                            decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: BorderRadius.circular(8.47)),
                            child: Row(
                              children: [
                                Text(
                                  "Edit",
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 10.76,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.25,
                                      color: AppColors.textColor),
                                ),
                                const Icon(
                                  Icons.edit,
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        color: AppColors.boxColor,
                        borderRadius: BorderRadius.circular(12.47)),
                    child: Column(
                      children: [
                        AlamatUser(
                          text1: "Nama",
                          text2: user.namaUser,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AlamatUser(
                          text1: "Alamat Email",
                          text2: user.emailUser,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AlamatUser(
                          text1: "Nomor Telepon",
                          text2: user.telpUser,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const AlamatUser(
                          text1: "Kata Sandi",
                          text2: "*******",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Data Alamat",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.25,
                              color: AppColors.textColor),
                        ),
                        GestureDetector(
                          onTap: controller.goToEditAddress,
                          child: Container(
                            margin: const EdgeInsets.all(0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 7),
                            decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: BorderRadius.circular(8.47)),
                            child: Row(
                              children: [
                                Text(
                                  "Edit",
                                  style: GoogleFonts.plusJakartaSans(
                                      fontSize: 10.76,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.25,
                                      color: AppColors.textColor),
                                ),
                                const Icon(
                                  Icons.edit,
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    decoration: BoxDecoration(
                        color: AppColors.boxColor,
                        borderRadius: BorderRadius.circular(12.47)),
                    child: Column(
                      children: [
                        AlamatUser(
                          text1: "Nama Penerima",
                          text2: address.penerimaAlamat,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AlamatUser(
                          text1: "Nomor Telepon Penerima",
                          text2: address.telpAlamat,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AlamatUser(
                          text1: "Provinsi",
                          text2: address.provinsiAlamat,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AlamatUser(
                          text1: "Kabupaten/Kota",
                          text2: address.kabkotAlamat,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AlamatUser(
                          text1: "Kecamatan",
                          text2: address.kecAlamat,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AlamatUser(
                          text1: "Kode Pos",
                          text2: address.kodeposAlamat,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AlamatUser(
                          text1: "Detail Alamat",
                          text2: address.detailAlamat,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 85),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.29)),
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.all(12)),
                      onPressed: controller.logout,
                      child: Center(
                        child: Text(
                          "Logout",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 16.62,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        }));
  }
}

class AlamatUser extends StatelessWidget {
  final String text1;
  final String text2;
  const AlamatUser({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text1,
          style: GoogleFonts.plusJakartaSans(
              fontSize: 13.76,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
              color: AppColors.textColor),
        ),
        Text(
          text2,
          style: GoogleFonts.plusJakartaSans(
              fontSize: 11.76,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
              color: AppColors.textColor),
        )
      ],
    );
  }
}
