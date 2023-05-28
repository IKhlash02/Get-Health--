class ApiEndpoint {
  static const String baseUrl =
      "http://192.168.0.105//get_healt/gethealthplus/";
  static const String formLogin = "${baseUrl}form_login.php";
  static const String produk = "${baseUrl}produk.php";
  static const String formRegister = "${baseUrl}register_gambar.php";
  static const String alamatUser = "${baseUrl}alamat_satu.php?id=";
  static const String userSatu = "${baseUrl}user_satu.php?id=";
  static const String editUser = "${baseUrl}form_editakun.php?id=";
  static const String editAlamat = "${baseUrl}form_editalamat.php?id=";
  static const String ulasanSatu = "${baseUrl}ulasan_satu.php?id_produk=";
  static const String keranjang = "${baseUrl}keranjang.php?id=";
  static const String deleteKeranjang =
      "${baseUrl}delete_darikeranjang.php?id_produk=";
  static const String pesanan = "${baseUrl}pesanan.php?id_user=";
  static const String tambahKeranjang =
      "${baseUrl}tambah_keranjang.php?id_produk=";
  static const String tambahPesan = "${baseUrl}checkout.php";
  static const String tambahPesanLangsung = "${baseUrl}checkout_langsung.php";
  static const String tambahUlasan = "${baseUrl}tambah_ulasan.php";
  static const String produkKategori =
      "${baseUrl}produk_kategori.php?id_kategori=";
  static const String search = "${baseUrl}search.php";
}
