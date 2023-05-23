// To parse this JSON data, do
//
//     final pesanan = pesananFromJson(jsonString);

import 'dart:convert';

class Pesanan {
  final String idPesanan;
  final DateTime tanggalPesanan;
  final int total;
  final String statusPesanan;
  final List<RincianPesanan> rincianPesanan;

  Pesanan({
    required this.idPesanan,
    required this.tanggalPesanan,
    required this.total,
    required this.statusPesanan,
    required this.rincianPesanan,
  });

  factory Pesanan.fromRawJson(String str) => Pesanan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pesanan.fromJson(Map<String, dynamic> json) => Pesanan(
        idPesanan: json["id_pesanan"],
        tanggalPesanan: DateTime.parse(json["tanggal_pesanan"]),
        total: json["total"],
        statusPesanan: json["status_pesanan"],
        rincianPesanan: List<RincianPesanan>.from(
            json["rincian_pesanan"].map((x) => RincianPesanan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_pesanan": idPesanan,
        "tanggal_pesanan": tanggalPesanan.toIso8601String(),
        "total": total,
        "status_pesanan": statusPesanan,
        "rincian_pesanan":
            List<dynamic>.from(rincianPesanan.map((x) => x.toJson())),
      };
}

class RincianPesanan {
  final String idProduk;
  final String gambar;
  final String namaProduk;
  final String jumlahPesanan;
  final String jenisSatuan;
  final int totalHarga;

  RincianPesanan({
    required this.idProduk,
    required this.gambar,
    required this.namaProduk,
    required this.jumlahPesanan,
    required this.jenisSatuan,
    required this.totalHarga,
  });

  factory RincianPesanan.fromRawJson(String str) =>
      RincianPesanan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RincianPesanan.fromJson(Map<String, dynamic> json) => RincianPesanan(
        idProduk: json["id_produk"],
        gambar: json["gambar"],
        namaProduk: json["nama_produk"],
        jumlahPesanan: json["jumlah_pesanan"],
        jenisSatuan: json["jenis_satuan"],
        totalHarga: json["total_harga"],
      );

  Map<String, dynamic> toJson() => {
        "id_produk": idProduk,
        "gambar": gambar,
        "nama_produk": namaProduk,
        "jumlah_pesanan": jumlahPesanan,
        "jenis_satuan": jenisSatuan,
        "total_harga": totalHarga,
      };
}
