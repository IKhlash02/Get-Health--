import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/data/providers/network/api_endpoint.dart';
import 'package:get_healt_2/screen/buttom_view/akun/user_edit.dart';
import 'package:get_healt_2/modules/auth/views/login_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/alamat_user_model.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repositories/alamat_user_api.dart';

import 'alamat_edit.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  late Future<List<dynamic>> _futureAlamatList;
  Future<void> removeId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove('id_user');
  }

  @override
  void initState() {
    _futureAlamatList = fetchAlamatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
            child: FutureBuilder<List<dynamic>>(
              future: _futureAlamatList,
              builder: ((context, snapshot) {
                AlamatUserModel? alamatList = snapshot.data?[0];
                UserModel? userlist = snapshot.data?[1];

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          width: 95,
                          height: 95,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: ClipOval(
                              child: Image.network(
                            '${ApiEndPoints.baseUrl}${userlist!.fotoUser}',
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        userlist.namaUser,
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
                                Get.to(UserEdit(userList: userlist));
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
                              text2: userlist.namaUser,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AlamatUser(
                              text1: "Alamat Email",
                              text2: userlist.emailUser,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AlamatUser(
                              text1: "Nomor Telepon",
                              text2: userlist.telpUser,
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
                              onTap: () {
                                Get.to(AlamatEdit(
                                  alamatList: alamatList!,
                                ));
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
                              text1: "Nama Penerima",
                              text2: alamatList!.penerimaAlamat,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AlamatUser(
                              text1: "Nomor Telepon Penerima",
                              text2: alamatList.telpAlamat,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AlamatUser(
                              text1: "Provinsi",
                              text2: alamatList.provinsiAlamat,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AlamatUser(
                              text1: "Kabupaten/Kota",
                              text2: alamatList.kabkotAlamat,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AlamatUser(
                              text1: "Kecamatan",
                              text2: alamatList.kecAlamat,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AlamatUser(
                              text1: "Kode Pos",
                              text2: alamatList.kodeposAlamat,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            AlamatUser(
                              text1: "Detail Alamat",
                              text2: alamatList.detailAlamat,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 85),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.29)),
                              backgroundColor: const Color(0xffCF6847),
                              padding: const EdgeInsets.all(12)),
                          onPressed: () {
                            removeId();
                            Get.offAll((const LoginView()));
                          },
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
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const Center(
                  child: Icon(Icons.error_outline),
                );
              }),
            )),
      ),
    );
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
