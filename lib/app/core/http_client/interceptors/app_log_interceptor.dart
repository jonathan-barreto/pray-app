import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Custom interceptor for logging HTTP requests, responses, and errors
class AppLogInterceptor extends Interceptor {
  /// Enable/disable request body logging
  final bool logRequestBody;
  
  /// Enable/disable response body logging
  final bool logResponseBody;
  
  /// Enable/disable request headers logging
  final bool logRequestHeaders;
  
  /// Enable/disable response headers logging
  final bool logResponseHeaders;
  
  /// Constructor with optional parameters to control logging
  AppLogInterceptor({
    this.logRequestBody = true,
    this.logResponseBody = false, // Set to false by default to avoid logging large responses
    this.logRequestHeaders = true,
    this.logResponseHeaders = false,
  });
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    
    debugPrint('┌───────────────────────────────────────────────────');
    debugPrint('│ 🔴 DIO ERROR [${err.type}]');
    debugPrint('│ 🔴 URL: $requestPath');
    debugPrint('│ 🔴 Method: ${options.method}');
    debugPrint('│ 🔴 Status Code: ${err.response?.statusCode}');
    debugPrint('│ 🔴 Status Message: ${err.response?.statusMessage}');
    
    if (err.response != null) {
      debugPrint('│ 🔴 Response: ${err.response}');
    }
    
    debugPrint('│ 🔴 Error Message: ${err.message}');
    debugPrint('└───────────────────────────────────────────────────');
    
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';
    
    debugPrint('┌───────────────────────────────────────────────────');
    debugPrint('│ 🟢 DIO REQUEST');
    debugPrint('│ 🟢 URL: $requestPath');
    debugPrint('│ 🟢 Method: ${options.method}');
    
    if (logRequestHeaders && options.headers.isNotEmpty) {
      debugPrint('│ 🟢 Headers:');
      options.headers.forEach((key, value) {
        debugPrint('│   $key: $value');
      });
    }
    
    if (logRequestBody && options.data != null) {
      debugPrint('│ 🟢 Body: ${options.data}');
    }
    
    debugPrint('└───────────────────────────────────────────────────');
    
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final requestPath = '${response.requestOptions.baseUrl}${response.requestOptions.path}';
    
    debugPrint('┌───────────────────────────────────────────────────');
    debugPrint('│ 🔵 DIO RESPONSE');
    debugPrint('│ 🔵 URL: $requestPath');
    debugPrint('│ 🔵 Method: ${response.requestOptions.method}');
    debugPrint('│ 🔵 Status Code: ${response.statusCode}');
    debugPrint('│ 🔵 Status Message: ${response.statusMessage}');
    
    if (logResponseHeaders && response.headers.map.isNotEmpty) {
      debugPrint('│ 🔵 Headers:');
      response.headers.map.forEach((key, values) {
        debugPrint('│   $key: ${values.join(', ')}');
      });
    }
    
    if (logResponseBody && response.data != null) {
      debugPrint('│ 🔵 Body: ${response.data}');
    }
    
    debugPrint('└───────────────────────────────────────────────────');
    
    super.onResponse(response, handler);
  }
}
