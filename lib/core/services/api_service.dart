import 'package:clot/core/services/shared_preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://vcare.integration25.com/api';

  ApiService(this._dio) {
    addInterceptors();
  }

  void addInterceptors() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await Prefs.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            options.headers['Accept'] = 'application/json';
          }
          return handler.next(options);
        },
      ),
    );
  }

  Future<dynamic> get({required String endPoint}) async {
    final Response response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    dynamic data,
    Options? options,
  }) async {
    final Response response = await _dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: options,
    );
    return response.data;
  }

  Future<dynamic> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    final Response response = await _dio.put('$baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<dynamic> delete({required String endPoint}) async {
    final Response response = await _dio.delete('$baseUrl$endPoint');
    return response.data;
  }
}
