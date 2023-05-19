import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../data/models/provinsi_model.dart';
import '../util/colors.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

import '../controller/id_provinsi.dart';

class DropDown extends StatelessWidget {
  final String hinText;
  final String message;
  final ValueChanged<String> onCustomWidgetCallback;
  DropDown(
      {super.key,
      required this.hinText,
      required this.message,
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
          "http://www.emsifa.com/api-wilayah-indonesia/api/provinces.json",
          queryParameters: {"filter": filter},
        );
        var models = ProvinsiModel.fromJsonList(response.data);
        return models;
      },
      onChanged: (ProvinsiModel? data) {
        idC.setId(data!.id);

        onCustomWidgetCallback(data.name);
      },
      validator: (value) {
        if (value == null) {
          return message;
        }
        return null;
      },
    );
  }
}
