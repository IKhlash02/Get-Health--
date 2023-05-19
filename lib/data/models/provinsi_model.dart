class ProvinsiModel {
  final String id;

  final String name;

  ProvinsiModel({
    required this.id,
    required this.name,
  });

  factory ProvinsiModel.fromJson(Map<String, dynamic> json) {
    return ProvinsiModel(
      id: json["id"],
      name: json["name"],
    );
  }

  static List<ProvinsiModel> fromJsonList(List list) {
    return list.map((item) => ProvinsiModel.fromJson(item)).toList();
  }

  @override
  String toString() => name;
}
