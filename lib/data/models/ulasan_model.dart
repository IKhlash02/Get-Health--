import 'dart:convert';

class Ulasan {
  final String namaUser;
  final String gambar;
  final DateTime timestampUlasan;
  final String rating;
  final String review;

  Ulasan({
    required this.namaUser,
    required this.gambar,
    required this.timestampUlasan,
    required this.rating,
    required this.review,
  });

  factory Ulasan.fromJson(Map<String, dynamic> json) => Ulasan(
        namaUser: json["nama_user"],
        gambar: json["gambar"],
        timestampUlasan: DateTime.parse(json["timestamp_ulasan"]),
        rating: json["rating"],
        review: json["review"],
      );
}
