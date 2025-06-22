import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/modules/auth/controllers/auth_controller.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/routes/app_routes.dart';
import 'package:get_healt_2/widget/button_login.dart';
import 'package:get_healt_2/widget/submit_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widget/text_norma.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const SizedBox(height: 40),
            _LoginHeader(),
            const SizedBox(height: 30),
            Text(
              "Login untuk belanja!",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.textColor),
            ),
            const SizedBox(height: 15),
            _buildLoginForm(),
            const SizedBox(height: 20),
            Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SubmitButton(
                      text: "Login",
                      onPressed: () => controller.loginUser(),
                    ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.register);
                  },
                  child: const TextNormal(
                    text: "Belum Punya Akun",
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      children: [
        const Row(
          children: [
            TextNormal(
              text: "Alamat Email",
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ButtonLogin(
          hinText: "XXXXX@email.com",
          obscureText: false,
          controller: controller.emailController,
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          children: [
            TextNormal(
              text: "Kata Sandi",
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          obscureText: controller.isPasswordHidden.value,
          decoration: InputDecoration(
            fillColor: AppColors.boxColor,
            filled: true,
            hintText: "********",
            suffixIcon: IconButton(
              icon: Icon(controller.isPasswordHidden.value
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: controller.togglePasswordVisibility,
            ),
            hintStyle: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
                color: AppColors.textColor),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12.47)),
          ),
          controller: controller.passwordController,
        ),
      ],
    );
  }
}

class _LoginHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        margin: const EdgeInsets.only(top: 40),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.primaryColor, AppColors.accentColor],
                ).createShader(bounds),
                child: Text(
                  'GetHealth',
                  style: GoogleFonts.montserrat(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: -10,
              child: ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.accentColor,
                    AppColors.primaryColor,
                  ],
                ).createShader(bounds),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: AppColors.accentColor, width: 3)),
                  child: Text(
                    '+',
                    style: GoogleFonts.montserrat(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
