import 'package:flutter/material.dart';

import '../../util/colors.dart';

class NotifikasiItem extends StatelessWidget {
  const NotifikasiItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: kotakColor, borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(4),
                    color: Colors.white,
                    child: const Icon(
                      Icons.local_shipping_outlined,
                      size: 35,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text("Paket Sedang dikemas",
                    style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Text(
              "05/08/2023, 16:21",
              style: Theme.of(context).textTheme.labelSmall,
            ),
          )
        ],
      ),
    );
  }
}
