import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/core/themes/app_theme.dart';
import 'package:get_healt_2/data/services/storage_services.dart';
import 'package:get_healt_2/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get Healt +',
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
