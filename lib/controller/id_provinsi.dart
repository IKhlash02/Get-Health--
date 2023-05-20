import 'package:get/get.dart';

class IdProvinsi extends GetxController {
  var idProv = "11".obs;
  var idKabupaten = "1103".obs;
  var idKecamatan = "1103010".obs;
  var idUser = "4".obs;

  setId(String id) => idProv.value = id;
  setIdKabupaten(String id) => idKabupaten.value = id;
  setIdKecamatan(String id) => idKecamatan.value = id;
  setIdUser(String id) => idUser.value = id;
}
