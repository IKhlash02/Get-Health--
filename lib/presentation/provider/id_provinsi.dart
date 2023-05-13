import 'package:get/get.dart';

class IdProvinsi extends GetxController {
  var idProv = "11".obs;

  setId(String id) => idProv.value = id;
}
