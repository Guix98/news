import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2',
      connectTimeout: const Duration(seconds: 45),
      receiveTimeout: const Duration(seconds: 45),
      responseType: ResponseType.json,
    ),
  );

  DioClient._internal() {
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
    );
  }

  static final DioClient instance = DioClient._internal();

  static Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  static Future<Response> post(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  static void _handleError(DioException e) {
    String errorMessage = '';

    switch (e.type) {
      case DioExceptionType.cancel:
        errorMessage = 'Request to the server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Connection timeout with the server';
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Receive timeout in connection with server';
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = 'Send timeout in connection with server';
        break;
      case DioExceptionType.badResponse:
        if (e.response != null) {
          switch (e.response!.statusCode) {
            case 400:
              errorMessage = 'Bad request';
              break;
            case 401:
              errorMessage = 'Unauthorized';
              break;
            case 403:
              errorMessage = 'Forbidden';
              break;
            case 404:
              errorMessage = 'Resource not found';
              break;
            case 500:
              errorMessage = 'Internal server error';
              break;
            default:
              errorMessage = 'Invalid status code: ${e.response!.statusCode}';
          }
        } else {
          errorMessage = 'Unexpected error with no response';
        }
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Connection to the server failed: ${e.message}';
        break;
      default:
        errorMessage = 'An unexpected error occurred';
    }

    debugPrint('DioException: $errorMessage');
  }
}
