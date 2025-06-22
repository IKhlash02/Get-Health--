import 'package:flutter/material.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/modules/auth/views/login_view.dart';

import '../widget/button_submit.dart';

class SuccesRegister extends StatelessWidget {
  const SuccesRegister({super.key});

  get tulisColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.done_rounded,
              size: 150,
              color: AppColors.primaryColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                "Selamat, akunmu telah berhasil didaftarkan! Sekarang, kamu bisa belanja obat-obatan kebutuhan kamu di GetHealth+!",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: tulisColor),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ButtonSubmit(
              text: "Ke Halaman Login",
              route: LoginView(),
            ),
          ]),
        ),
      ),
    );
  }
}
