class AddressModel {
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

  AddressModel({
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

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
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

  AddressModel copyWith({
    String? idAlamat,
    String? idUser,
    String? namaAlamat,
    String? penerimaAlamat,
    String? telpAlamat,
    String? provinsiAlamat,
    String? kabkotAlamat,
    String? kecAlamat,
    String? kelAlamat,
    String? kodeposAlamat,
    String? detailAlamat,
    String? favoritAlamat,
  }) {
    return AddressModel(
      idAlamat: idAlamat ?? this.idAlamat,
      idUser: idUser ?? this.idUser,
      namaAlamat: namaAlamat ?? this.namaAlamat,
      penerimaAlamat: penerimaAlamat ?? this.penerimaAlamat,
      telpAlamat: telpAlamat ?? this.telpAlamat,
      provinsiAlamat: provinsiAlamat ?? this.provinsiAlamat,
      kabkotAlamat: kabkotAlamat ?? this.kabkotAlamat,
      kecAlamat: kecAlamat ?? this.kecAlamat,
      kelAlamat: kelAlamat ?? this.kelAlamat,
      kodeposAlamat: kodeposAlamat ?? this.kodeposAlamat,
      detailAlamat: detailAlamat ?? this.detailAlamat,
      favoritAlamat: favoritAlamat ?? this.favoritAlamat,
    );
  }
}
