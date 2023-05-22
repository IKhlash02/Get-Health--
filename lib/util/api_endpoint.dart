class ApiEndpoint {
  static const String baseUrl =
      "http://192.168.0.105//get_healt/gethealthplus/";
  static const String formLogin = "${baseUrl}form_login.php";
  static const String produk = "${baseUrl}produk.php";
  static const String formRegister = "${baseUrl}register_api.php";
  static const String alamatUser = "${baseUrl}alamat_satu.php?id=";
  static const String userSatu = "${baseUrl}user_satu.php?id=";
  static const String editUser = "${baseUrl}form_editakun.php?id=";
  static const String editAlamat = "${baseUrl}form_editalamat.php?id=";
}
