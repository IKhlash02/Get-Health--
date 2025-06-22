import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/core/themes/app_theme.dart';
import 'package:get_healt_2/screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Healt +',
      theme: AppTheme.lightTheme,
      home: const Login(),
    );
  }
}
