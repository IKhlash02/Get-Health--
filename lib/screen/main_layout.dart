// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_healt_2/core/values/app_colors.dart';

import 'buttom_view/akun/akun_page.dart';
import '../modules/home/views/home_view.dart';
import 'buttom_view/keranjang_page.dart';
import 'buttom_view/notifikasi_page.dart';
import 'buttom_view/pesan/pesanan_page.dart';

class MainLayout extends StatefulWidget {
  int selectedNavbar;
  MainLayout({super.key, this.selectedNavbar = 0});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const NotifikasiPage(),
    const KeranjangPage(),
    const PesananPage(),
    const AkunPage()
  ];
  void _changeSelectedNavBar(int index) {
    setState(() {
      widget.selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(widget.selectedNavbar),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        currentIndex: widget.selectedNavbar,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
