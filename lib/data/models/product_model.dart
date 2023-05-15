class Produk {
  late String idProduk;
  late String gambar;
  late String idGolongan;
  late String namaProduk;
  late String deskripsiProduk;
  late String indikasi;
  late String kontraindikasi;
  late String komposisi;
  late String aturanPakai;
  late String efekSamping;
  late String peringatanPerhatian;
  late String hargaProduk;
  late String jenisSatuan;
  late String perluResep;

  Produk({
    required this.idProduk,
    required this.gambar,
    required this.idGolongan,
    required this.namaProduk,
    required this.deskripsiProduk,
    required this.indikasi,
    required this.kontraindikasi,
    required this.komposisi,
    required this.aturanPakai,
    required this.efekSamping,
    required this.peringatanPerhatian,
    required this.hargaProduk,
    required this.jenisSatuan,
    required this.perluResep,
  });

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      idProduk: json['id_produk'],
      gambar: json['gambar'],
      idGolongan: json['id_golongan'],
      namaProduk: json['nama_produk'],
      deskripsiProduk: json['deskripsi_produk'],
      indikasi: json['indikasi'],
      kontraindikasi: json['kontraindikasi'],
      komposisi: json['komposisi'],
      aturanPakai: json['aturan_pakai'],
      efekSamping: json['efek_samping'],
      peringatanPerhatian: json['peringatan_perhatian'],
      hargaProduk: json['harga_produk'],
      jenisSatuan: json['jenis_satuan'],
      perluResep: json['perlu_resep'],
    );
  }
}
