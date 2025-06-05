import 'dart:io';
// import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:paxride/common/constants.dart';

class ApiService {
  final Dio _dio;

  ApiService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: Constants.apiEndpoint,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${Constants.apiKey}',
            'Accept': '*/*',
          },
        ),
      ) {
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  Future<Response> get(String endpoint, {String? token}) async {
    try {
      return await _dio.get(endpoint, options: _buildOptions(token));
    } catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> post(
    String endpoint,
    Map<String, dynamic> data, {
    String? token,
  }) async {
    try {
      return await _dio.post(
        endpoint,
        data: data,
        options: _buildOptions(token),
      );
    } catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> patch(
    String endpoint,
    Map<String, dynamic> data, {
    String? token,
  }) async {
    try {
      return await _dio.patch(
        endpoint,
        data: data,
        options: _buildOptions(token),
      );
    } catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> delete(String endpoint, {String? token}) async {
    try {
      return await _dio.delete(endpoint, options: _buildOptions(token));
    } catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> uploadFile(
    String endpoint,
    File file, {
    String? token,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path),
      });
      return await _dio.post(
        endpoint,
        data: formData,
        options: _buildOptions(token),
      );
    } catch (e) {
      throw _handleDioError(e);
    }
  }

  Options _buildOptions(String? token) {
    return Options(headers: {if (token != null) 'X-User': token});
  }

  Exception _handleDioError(dynamic error) {
    if (error is DioException) {
      final response = error.response;
      final statusCode = response?.statusCode;
      final message = response?.data?['message'] ?? error.message;

      return Exception('[$statusCode] $message');
    }
    return Exception('Unexpected error: $error');
  }
}
