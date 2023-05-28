// To parse this JSON data, do
//
//     final notifikasi = notifikasiFromJson(jsonString);

import 'dart:convert';

class Notifikasi {
  final DateTime timestampNotif;
  final DateTime timestampPesanan;
  final String statusPesanan;
  final int kode;

  Notifikasi({
    required this.timestampNotif,
    required this.timestampPesanan,
    required this.statusPesanan,
    required this.kode,
  });

  factory Notifikasi.fromRawJson(String str) =>
      Notifikasi.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Notifikasi.fromJson(Map<String, dynamic> json) => Notifikasi(
        timestampNotif: DateTime.parse(json["timestamp_notif"]),
        timestampPesanan: DateTime.parse(json["timestamp_pesanan"]),
        statusPesanan: json["status_pesanan"],
        kode: json["kode"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp_notif": timestampNotif.toIso8601String(),
        "timestamp_pesanan": timestampPesanan.toIso8601String(),
        "status_pesanan": statusPesanan,
        "kode": kode,
      };
}
