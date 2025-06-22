import 'package:get/get.dart'; // Buat file ini
import 'package:get_healt_2/bindings/main_layout_binding.dart';
import 'package:get_healt_2/modules/auth/bindings/auth_binding.dart';
import 'package:get_healt_2/modules/auth/views/register.dart';
import 'package:get_healt_2/modules/home/bindings/home_binding.dart';
import 'package:get_healt_2/modules/auth/views/login_view.dart';
import 'package:get_healt_2/modules/products/bindings/product_binding.dart';
import 'package:get_healt_2/modules/products/bindings/search_binding.dart';
import 'package:get_healt_2/modules/products/views/search_view.dart';
import 'package:get_healt_2/modules/profile/binding/profile_binding.dart';
import 'package:get_healt_2/modules/profile/views/edit_address_view.dart';
import 'package:get_healt_2/modules/profile/views/profil_view.dart';
import 'package:get_healt_2/modules/profile/views/user_edit_view.dart';
import 'package:get_healt_2/screen/main_layout.dart';
import 'package:get_healt_2/modules/products/views/product_detail_view.dart';

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
        binding: MainLayoutBinding()),
    GetPage(
        name: Routes.productDetail,
        page: () => const ProductDetailView(),
        transition: Transition.downToUp,
        binding: ProductBinding()),
    GetPage(
        name: Routes.search,
        page: () => const SearchView(),
        transition: Transition.upToDown,
        binding: SearchBinding()),
    GetPage(
        name: Routes.profile,
        page: () => const ProfilView(),
        transition: Transition.leftToRight,
        binding: ProfileBinding()),
    GetPage(
        name: Routes.editUserAccount,
        page: () => const UserEditView(),
        transition: Transition.leftToRight,
        binding: ProfileBinding()),
    GetPage(
        name: Routes.editAddress,
        page: () => const EditAddressView(),
        transition: Transition.rightToLeft,
        binding: ProfileBinding()),
  ];
}
