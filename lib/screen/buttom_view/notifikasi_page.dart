import 'package:flutter/material.dart';

import 'package:get_healt/widget/notifikasi_item.dart';

import '../../util/colors.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text("NOTIFIKASI",
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 32,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Tandai Sudah Dibaca (99)",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.all(5.0),
                child: NotifikasiItem(),
              );
            },
            itemCount: 10,
          ))
        ],
      ),
    );
  }
}
