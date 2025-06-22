class ReviewModel {
  final String id;
  final String idUser;
  final String userName;
  final String rating;
  final String review;
  final DateTime timestamp;

  ReviewModel({
    required this.id,
    required this.idUser,
    required this.userName,
    required this.timestamp,
    required this.rating,
    required this.review,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id_ulasan"],
        idUser: json["id_user"],
        userName: json["nama_user"],
        timestamp: DateTime.parse(json["timestamp_ulasan"]),
        rating: json["rating"],
        review: json["review"],
      );
}
