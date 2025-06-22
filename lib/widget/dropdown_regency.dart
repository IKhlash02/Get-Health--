import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:get/get.dart';
import 'package:get_healt_2/core/values/app_colors.dart';

import '../data/models/provinsi_model.dart';

import 'package:dio/dio.dart';

import '../controller/id_provinsi.dart';

class DropDownRegency extends StatelessWidget {
  final String hinText;
  final String message;
  final String id;
  final ValueChanged<String> onCustomWidgetCallback;
  DropDownRegency(
      {super.key,
      required this.hinText,
      required this.message,
      required this.id,
      required this.onCustomWidgetCallback});

  final idC = Get.find<IdProvinsi>();
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<ProvinsiModel>(
        decoratorProps: DropDownDecoratorProps(
          baseStyle: const TextStyle(color: AppColors.textColor),
          decoration: InputDecoration(
            labelStyle: const TextStyle(color: AppColors.textColor),
            fillColor: AppColors.boxColor,
            filled: true,
            hintText: hinText,
            hintStyle: const TextStyle(color: AppColors.textColor),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12.47)),
          ),
        ),
        items: (String filter, _) async {
          var response = await Dio().get(
            "https://emsifa.github.io/api-wilayah-indonesia/api/regencies/$id.json",
            queryParameters: {"filter": filter},
          );
          var models = ProvinsiModel.fromJsonList(response.data);

          return models;
        },
        onChanged: (ProvinsiModel? data) {
          idC.setIdKabupaten(data!.id);
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
