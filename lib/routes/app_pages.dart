import 'package:get/get.dart'; // Buat file ini
import 'package:get_healt_2/modules/auth/bindings/auth_binding.dart';
import 'package:get_healt_2/modules/auth/views/register.dart';
import 'package:get_healt_2/screen/buttom_view/beranda_page.dart';
import 'package:get_healt_2/modules/auth/views/login_view.dart';

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
      page: () =>
          const BerandaPage(), // Ganti ini dengan halaman NavbarButton Anda
      transition: Transition.zoom,
    ),
    // --- Tambahkan rute lain di sini ---
    // Contoh rute dengan parameter:
    // GetPage(
    //   name: Routes.PRODUCT_DETAIL,
    //   page: () => const ProductDetailView(),
    //   binding: ProductDetailBinding(),
    // ),
  ];
}
