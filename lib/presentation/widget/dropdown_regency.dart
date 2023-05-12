import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_healt/data/models/provinsi_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/provinsi_model.dart';
import '../../util/colors.dart';

import 'package:dio/dio.dart';

class DropDownRegency extends StatelessWidget {
  final String hinText;
  final String message;

  DropDownRegency({super.key, required this.hinText, required this.message});

  String? id;
  getNama() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    id = pref.getString('id_prov') ?? '11';
    print("$id");
  }

  @override
  Widget build(BuildContext context) {
    getNama();
    return DropdownSearch<ProvinsiModel>(
        dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: const TextStyle(color: tulisanColor),
            dropdownSearchDecoration: InputDecoration(
              labelStyle: const TextStyle(color: tulisanColor),
              fillColor: kotakColor,
              filled: true,
              hintText: hinText,
              hintStyle: const TextStyle(color: tulisanColor),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12.47)),
            )),
        asyncItems: (String filter) async {
          var response = await Dio().get(
            "https://emsifa.github.io/api-wilayah-indonesia/api/regencies/11.json",
            queryParameters: {"filter": filter},
          );
          var models = ProvinsiModel.fromJsonList(response.data);

          return models;
        },
        onChanged: (ProvinsiModel? data) {},
        validator: (value) {
          if (value == null) {
            return message;
          }
          return null;
        });
  }
}
