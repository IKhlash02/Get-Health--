import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt/screen/login.dart';
import 'package:google_fonts/google_fonts.dart';

class AkunPage extends StatefulWidget {
  const AkunPage({super.key});

  @override
  State<AkunPage> createState() => _AkunPageState();
}

class _AkunPageState extends State<AkunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Icon(
                Icons.account_circle_outlined,
                size: 104,
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
                  Get.offAll((const Login()));
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
        ),
      ),
    );
  }
}
