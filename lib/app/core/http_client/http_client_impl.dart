import 'package:dio/dio.dart';
import 'package:pray_app/app/core/errors/exceptions.dart';
import 'package:pray_app/app/core/http_client/http_client.dart';
import 'package:pray_app/app/core/http_client/interceptors/app_log_interceptor.dart';
import 'package:pray_app/app/core/http_client/interceptors/token_interceptor.dart';

class HttpClientImpl implements HttpClient {
  final Dio _dio;

  /// Constructor for HttpClientImpl
  ///
  /// [dio] - Dio instance to use for HTTP requests
  /// [useTokenInterceptor] - Whether to use the token interceptor
  HttpClientImpl({required Dio dio, bool useTokenInterceptor = false})
    : _dio = dio {
    // Add token interceptor FIRST if enabled (so it runs before logging)
    if (useTokenInterceptor) {
      _dio.interceptors.add(TokenInterceptor());
    }

    // Add log interceptor AFTER token interceptor (so it logs the final headers)
    _dio.interceptors.add(
      AppLogInterceptor(
        logRequestBody: true,
        logResponseBody: true,
        logRequestHeaders: true,
        logResponseHeaders: false,
      ),
    );

    _dio.options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBkYndkbnZhanF4YnViamVtdnVzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTg2NDI4MDMsImV4cCI6MjA3NDIxODgwM30.nizoT-cTEchabY6XSQ1xgCP0fK7Mgc_5DtTFJXlJKx4';
  }

  @override
  Future<HttpResponse> get({required String endpoint}) async {
    try {
      final Response response = await _dio.get(endpoint);

      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (err) {
      throw HttpException.prepare(err);
    } catch (e) {
      throw HttpException(
        type: HttpExceptionType.generic,
        message: 'Unexpected error: $e',
      );
    }
  }

  @override
  Future<HttpResponse> post({required String endpoint, required body}) async {
    try {
      final Response response = await _dio.post(endpoint, data: body);

      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (err) {
      throw HttpException.prepare(err);
    } catch (e) {
      throw HttpException(
        type: HttpExceptionType.generic,
        message: 'Unexpected error: $e',
      );
    }
  }

  @override
  Future<HttpResponse> put({required String endpoint, required body}) async {
    try {
      final Response response = await _dio.put(endpoint, data: body);

      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (err) {
      throw HttpException.prepare(err);
    } catch (e) {
      throw HttpException(
        type: HttpExceptionType.generic,
        message: 'Unexpected error: $e',
      );
    }
  }

  @override
  Future<HttpResponse> patch({required String endpoint, required body}) async {
    try {
      final Response response = await _dio.patch(endpoint, data: body);

      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (err) {
      throw HttpException.prepare(err);
    } catch (e) {
      throw HttpException(
        type: HttpExceptionType.generic,
        message: 'Unexpected error: $e',
      );
    }
  }

  /// Add a delete method for completeness
  @override
  Future<HttpResponse> delete({required String endpoint, dynamic body}) async {
    try {
      final Response response = await _dio.delete(endpoint, data: body);

      return HttpResponse(
        data: response.data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (err) {
      throw HttpException.prepare(err);
    } catch (e) {
      throw HttpException(
        type: HttpExceptionType.generic,
        message: 'Unexpected error: $e',
      );
    }
  }
}
