// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/controller/navigation_controller.dart';
import 'package:get_healt_2/core/values/app_colors.dart';

import '../modules/profile/views/profil_view.dart';
import '../modules/home/views/home_view.dart';
import 'buttom_view/keranjang_page.dart';
import 'buttom_view/notifikasi_page.dart';
import 'buttom_view/pesan/pesanan_page.dart';

class MainLayout extends GetView<NavigationController> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = <Widget>[
      const HomeView(),
      const NotifikasiPage(),
      const KeranjangPage(),
      const PesananPage(),
      const ProfilView()
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Keranjang'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined), label: 'Pesanan'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        currentIndex: controller.selectedIndex.value,
        showUnselectedLabels: true,
        onTap: controller.changePage,
      ),
    );
  }
}
