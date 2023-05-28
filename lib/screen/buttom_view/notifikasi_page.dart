import 'package:flutter/material.dart';

import '../../data/models/notifikasi_models.dart';
import '../../data/repositories/notifikasi_data.dart';
import '../../util/colors.dart';

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  late Future<List<Notifikasi>> _notifikasi;

  @override
  void initState() {
    super.initState();
    _notifikasi = fetchNotifikasi();
  }

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
            height: 32,
          ),
          FutureBuilder<List<Notifikasi>>(
              future: _notifikasi,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Notifikasi>? notifikasiData = snapshot.data;
                  return ListView.builder(
                    itemCount: notifikasiData?.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: kotakColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  color: Colors.white,
                                  child: Image.asset((notifikasiData![index]
                                              .kode ==
                                          0)
                                      ? "images/dikemas.png"
                                      : (notifikasiData[index].kode == 1)
                                          ? "images/dikirim.png"
                                          : (notifikasiData[index].kode == 2)
                                              ? "images/diterima.png"
                                              : "images/ditolak.png"),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          notifikasiData[index]
                                              .timestampNotif
                                              .toString(),
                                          textAlign: TextAlign.end,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(notifikasiData[index].statusPesanan,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  String message = "${snapshot.error}";
                  String messageClean = message.replaceAll("Exception: ", "");

                  return Center(
                      child: Text(
                    messageClean,
                    textAlign: TextAlign.center,
                  ));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ));
                }
                return const SizedBox(
                  height: 0,
                );
              })
        ],
      ),
    );
  }
}
