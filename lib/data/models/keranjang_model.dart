import 'dart:convert';

class Keranjang {
  final int total;
  final List<String> produkCheckout;
  final List<Datum> data;

  Keranjang({
    required this.total,
    required this.produkCheckout,
    required this.data,
  });

  factory Keranjang.fromRawJson(String str) =>
      Keranjang.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Keranjang.fromJson(Map<String, dynamic> json) => Keranjang(
        total: json["total"],
        produkCheckout:
            List<String>.from(json["produk_checkout"].map((x) => x)),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "produk_checkout": List<dynamic>.from(produkCheckout.map((x) => x)),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String idProduk;
  final String namaProduk;
  final String jumlah;
  final String jenisSatuan;
  final String totalHarga;
  final String gambar;

  Datum({
    required this.idProduk,
    required this.namaProduk,
    required this.jumlah,
    required this.jenisSatuan,
    required this.totalHarga,
    required this.gambar,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idProduk: json["id_produk"],
        namaProduk: json["nama_produk"],
        jumlah: json["jumlah"],
        jenisSatuan: json["jenis_satuan"],
        totalHarga: json["total_harga"],
        gambar: json["gambar"],
      );

  Map<String, dynamic> toJson() => {
        "id_produk": idProduk,
        "nama_produk": namaProduk,
        "jumlah": jumlah,
        "jenis_satuan": jenisSatuan,
        "total_harga": totalHarga,
      };
}
