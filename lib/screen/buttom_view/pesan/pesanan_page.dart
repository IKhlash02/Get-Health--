import 'package:flutter/material.dart';
import 'package:get_healt_2/core/values/app_colors.dart';
import 'package:get_healt_2/screen/buttom_view/pesan/tolak.dart';
import 'package:get_healt_2/screen/buttom_view/pesan/ulasan.dart';

import 'item_kirim.dart';
import 'item_proses.dart';

class PesananPage extends StatefulWidget {
  const PesananPage({super.key});

  @override
  State<PesananPage> createState() => _PesananPageState();
}

class _PesananPageState extends State<PesananPage> {
  int _selectedIndex = 0;

  List<Widget> route = [
    const ItemProses(),
    ItemKirim(),
    const UlasanPage(),
    const TolakPage(),
  ];

  Color _button1Color = Colors.white;
  Color _button2Color = Colors.white;
  Color _button3Color = Colors.white;
  Color _button4Color = Colors.white;

  void _updateButtonColors(int buttonIndex) {
    setState(() {
      _button1Color = buttonIndex == 0 ? AppColors.accentColor : Colors.white;
      _button2Color = buttonIndex == 1 ? AppColors.accentColor : Colors.white;
      _button3Color = buttonIndex == 2 ? AppColors.accentColor : Colors.white;
      _button4Color = buttonIndex == 3 ? AppColors.accentColor : Colors.white;
    });
  }

  @override
  void initState() {
    _updateButtonColors(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Text("PESANAN SAYA",
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                      _updateButtonColors(_selectedIndex);
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    decoration: BoxDecoration(
                      color: _button1Color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('Dikemas',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                      _updateButtonColors(_selectedIndex);
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    decoration: BoxDecoration(
                      color: _button2Color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('Dikirim',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                      _updateButtonColors(_selectedIndex);
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    decoration: BoxDecoration(
                      color: _button3Color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('Selesai',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                      _updateButtonColors(_selectedIndex);
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    decoration: BoxDecoration(
                      color: _button4Color,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text('Ditolak',
                        style: Theme.of(context).textTheme.bodySmall),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: route[_selectedIndex],
            ),
          ],
        ),
      ),
    );
  }
}
