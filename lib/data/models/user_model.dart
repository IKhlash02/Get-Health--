import 'dart:convert';

class UserModel {
  final String idUser;
  final String namaUser;
  final String emailUser;
  final String passwordUser;
  final String telpUser;
  final String fotoUser;

  UserModel({
    required this.idUser,
    required this.namaUser,
    required this.emailUser,
    required this.passwordUser,
    required this.telpUser,
    required this.fotoUser,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["id_user"],
        namaUser: json["nama_user"],
        emailUser: json["email_user"],
        passwordUser: json["password_user"],
        telpUser: json["telp_user"],
        fotoUser: json["foto_user"],
      );
}
