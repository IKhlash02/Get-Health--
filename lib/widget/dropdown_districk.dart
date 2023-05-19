import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';

import '../controller/id_provinsi.dart';
import '../data/models/provinsi_model.dart';
import '../util/colors.dart';

import 'package:dio/dio.dart';

class DropdownDistrict extends StatelessWidget {
  final String hinText;
  final String message;
  final String id;
  final ValueChanged<String> onCustomWidgetCallback;
  DropdownDistrict(
      {super.key,
      required this.hinText,
      required this.message,
      required this.id,
      required this.onCustomWidgetCallback});
  final idC = Get.find<IdProvinsi>();
  @override
  Widget build(BuildContext context) {
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
            "http://www.emsifa.com/api-wilayah-indonesia/api/districts/$id.json",
            queryParameters: {"filter": filter},
          );
          var models = ProvinsiModel.fromJsonList(response.data);

          return models;
        },
        onChanged: (ProvinsiModel? data) {
          idC.setIdKecamatan(data!.id);
          onCustomWidgetCallback(data.name);
        },
        validator: (value) {
          if (value == null) {
            return message;
          }
          return null;
        });
  }
}
