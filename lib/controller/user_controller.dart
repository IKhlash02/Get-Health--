import 'package:get/get.dart';

class UserController extends GetxController {
  var nama = "11".obs;
  var email = "1103".obs;
  var password = "1103010".obs;
  var telephon = "4".obs;

  setNama(String id) => nama.value = id;
  setEmail(String id) => email.value = id;
  setPassword(String id) => password.value = id;
  setTelephon(String id) => telephon.value = id;
}
