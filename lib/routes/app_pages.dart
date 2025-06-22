import 'package:get/get.dart'; // Buat file ini
import 'package:get_healt_2/modules/auth/bindings/auth_binding.dart';
import 'package:get_healt_2/modules/auth/views/register.dart';
import 'package:get_healt_2/modules/home/bindings/home_binding.dart';
import 'package:get_healt_2/modules/home/views/home_view.dart';
import 'package:get_healt_2/modules/auth/views/login_view.dart';
import 'package:get_healt_2/screen/main_layout.dart';
import 'package:get_healt_2/screen/product_detail_view.dart';

import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;

  static final routes = <GetPage>[
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
      transition: Transition.fadeIn, // Tambahkan transisi keren
    ),
    GetPage(
      name: Routes.register,
      page: () => const RegisterView(), // Asumsikan Anda sudah buat view ini
      binding: AuthBinding(), // Seringkali bisa pakai binding yang sama
      transition: Transition.rightToLeft,
    ),
    GetPage(
        name: Routes.home,
        page: () => MainLayout(),
        transition: Transition.zoom,
        binding: HomeBinding()),
    GetPage(
      name: Routes.productDetail,
      page: () => const RegisterView(),
      transition: Transition.downToUp,
    ),
  ];
}
