import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:get_healt_2/data/providers/network/api_endpoint.dart';
import 'package:get_healt_2/data/services/storage_services.dart';

class ApiProvider {
  final Dio _dio;

  ApiProvider() : _dio = Dio() {
    // Konfigurasi dasar Dio
    _dio.options = BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 15), // 15 detik
      receiveTimeout: const Duration(seconds: 15), // 15 detik
      responseType: ResponseType.json,
    );

    // Tambahkan Interceptor untuk logging dan error handling
    _dio.interceptors.add(_loggingInterceptor());
  }

  Interceptor _loggingInterceptor() {
    final storageService = Get.find<StorageService>();

    return InterceptorsWrapper(
      onRequest: (options, handler) {
        // Ambil token dari storage
        final String? token = storageService.read<String>('auth_token');

        // Tambahkan header Authorization jika token ada
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }

        options.headers['Accept'] = 'application/json';

        return handler.next(options); // Lanjutkan request
      },
      onResponse: (response, handler) {
        return handler.next(response); // Lanjutkan dengan response
      },
      onError: (DioException e, handler) {
        return handler.next(e);
      },
    );
  }

  /// --- METODE HTTP --- ///

  // Metode GET
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }

  // Metode POST
  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }

  // Metode PUT
  Future<Response> put(String path, dynamic data) async {
    try {
      final response = await _dio.put(path, data: data);
      return response;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }

  // Metode DELETE
  Future<Response> delete(String path) async {
    try {
      final response = await _dio.delete(path);
      return response;
    } on DioException catch (e) {
      throw e.message.toString();
    }
  }
}
