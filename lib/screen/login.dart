import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt/widget/button_login.dart';
import 'package:get_healt/widget/submit_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/login_controller.dart';
import '../util/colors.dart';
import '../widget/text_norma.dart';
import 'register.dart';

class Login extends StatelessWidget {
  Login({super.key});
  LoginController loginController = Get.put(LoginController());

  var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 40,
            ),
            Center(
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
                          colors: [primerColor, aksenColor],
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
                            aksenColor,
                            primerColor,
                          ],
                        ).createShader(bounds),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: aksenColor, width: 3)),
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Halo!",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  width: 80,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Login untuk belanja!",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: tulisanColor),
            ),
            const SizedBox(
              height: 15,
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
            ButtonLogin(
              hinText: "XXXXX@email.com",
              obscureText: false,
              controller: loginController.emailController,
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
            ButtonLogin(
              hinText: "*******",
              obscureText: true,
              controller: loginController.passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            SubmitButton(
              text: "Login",
              onPressed: () => loginController.loginUser(),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ));
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
}
