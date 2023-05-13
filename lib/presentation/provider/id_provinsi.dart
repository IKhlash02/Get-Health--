import 'package:get/get.dart';

class IdProvinsi extends GetxController {
  var idProv = "11".obs;
  var idKabupaten = "1103".obs;

  setId(String id) => idProv.value = id;
  setIdKabupaten(String id) => idKabupaten.value = id;
}
