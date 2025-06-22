// Mencegah instansiasi kelas ini
abstract class Routes {
  Routes._();

  // Rute utama
  static const splash = '/splash';
  static const home = '/home';

  // Rute Autentikasi
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';

  // Rute Produk
  static const products = '/products';
  static const productDetail = '/products/detail';
  static const search = '/search';

  static const categories = '/categories';
  static const categoryProduct = '/categories/:id';

  // Rute lainnya
  static const profile = '/profile';
  static const orders = '/orders';
  static const checkout = '/checkout';
}
