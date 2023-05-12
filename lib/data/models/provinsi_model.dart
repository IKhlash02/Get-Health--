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

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ${this.name}';
  }

  ///this method will prevent the override of toString
  // bool userFilterByCreationDate(String filter) {
  //   return this.createdAt.toString().contains(filter);
  // }

  // ///custom comparing function to check if two users are equal
  // bool isEqual(ProvinsiModel model) {
  //   return this.id == model.id;
  // }

  @override
  String toString() => name;
}

// import 'package:dio/dio.dart';

// class ProvinsiModel {
//   final String id;
//   final String name;

//   ProvinsiModel({required this.id, required this.name});

//   factory ProvinsiModel.fromJson(Map<String, dynamic> json) {
//     return ProvinsiModel(
//       id: json['id'].toString(),
//       name: json['name'],
//     );
//   }

//   static Future<List<ProvinsiModel>> getProvinsiList() async {
//     var response = await Dio().get(
//         "https://emsifa.github.io/api-wilayah-indonesia/api/provinces.json");
//     var data = List<Map<String, dynamic>>.from(response.data);
//     return data.map((item) => ProvinsiModel.fromJson(item)).toList();
//   }
// }

// class KabupatenModel {
//   final String id;
//   final String name;

//   KabupatenModel({required this.id, required this.name});

//   factory KabupatenModel.fromJson(Map<String, dynamic> json) {
//     return KabupatenModel(
//       id: json['id'].toString(),
//       name: json['name'],
//     );
//   }

//   static Future<List<KabupatenModel>> getKabupatenList(
//       String provinceId) async {
//     var response = await Dio().get(
//         "https://emsifa.github.io/api-wilayah-indonesia/api/regencies/$provinceId.json");
//     var data = List<Map<String, dynamic>>.from(response.data);
//     return data.map((item) => KabupatenModel.fromJson(item)).toList();
//   }
// }
