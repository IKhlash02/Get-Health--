import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class JsonProvider {
  Future<dynamic> readJson(String filePath) async {
    try {
      final String response = await rootBundle.loadString(filePath);
      final data = await json.decode(response);
      return data;
    } catch (e) {
      throw Exception('Gagal membaca file JSON: $e');
    }
  }
}
