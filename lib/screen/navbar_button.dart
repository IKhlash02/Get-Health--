import 'package:flutter/material.dart';
import 'package:get_healt/util/colors.dart';

import 'buttom_view/akun/akun_page.dart';
import 'buttom_view/beranda_page.dart';
import 'buttom_view/keranjang_page.dart';
import 'buttom_view/notifikasi_page.dart';
import 'buttom_view/pesan/pesanan_page.dart';

class NavbarButton extends StatefulWidget {
  int selectedNavbar;
  NavbarButton({super.key, this.selectedNavbar = 0});

  @override
  State<NavbarButton> createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton> {
  final List<Widget> _widgetOptions = <Widget>[
    const BerandaPage(),
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
        backgroundColor: primerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        currentIndex: widget.selectedNavbar,
        showUnselectedLabels: true,
        onTap: _changeSelectedNavBar,
      ),
    );
  }
}
