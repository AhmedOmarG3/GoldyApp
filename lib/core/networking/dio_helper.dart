import 'package:dio/dio.dart';
import 'dio_constants.dart';

class DioHelper {
  static late Dio _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: DioConstants.baseUrl,
        connectTimeout: DioConstants.connectTimeout,
        receiveTimeout: DioConstants.receiveTimeout,
        headers: DioConstants.defaultHeaders,
      ),
    );
  }

  static Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );
  }
}
