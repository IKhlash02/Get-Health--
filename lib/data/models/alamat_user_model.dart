class AlamatUserModel {
  final String idAlamat;
  final String idUser;
  final String namaAlamat;
  final String penerimaAlamat;
  final String telpAlamat;
  final String provinsiAlamat;
  final String kabkotAlamat;
  final String kecAlamat;
  final String kelAlamat;
  final String kodeposAlamat;
  final String detailAlamat;
  final String favoritAlamat;

  AlamatUserModel({
    required this.idAlamat,
    required this.idUser,
    required this.namaAlamat,
    required this.penerimaAlamat,
    required this.telpAlamat,
    required this.provinsiAlamat,
    required this.kabkotAlamat,
    required this.kecAlamat,
    required this.kelAlamat,
    required this.kodeposAlamat,
    required this.detailAlamat,
    required this.favoritAlamat,
  });

  factory AlamatUserModel.fromJson(Map<String, dynamic> json) {
    return AlamatUserModel(
      idAlamat: json["id_alamat"],
      idUser: json["id_user"],
      namaAlamat: json["nama_alamat"],
      penerimaAlamat: json["penerima_alamat"],
      telpAlamat: json["telp_alamat"],
      provinsiAlamat: json["provinsi_alamat"],
      kabkotAlamat: json["kabkot_alamat"],
      kecAlamat: json["kec_alamat"],
      kelAlamat: json["kel_alamat"],
      kodeposAlamat: json["kodepos_alamat"],
      detailAlamat: json["detail_alamat"],
      favoritAlamat: json["favorit_alamat"],
    );
  }
}
