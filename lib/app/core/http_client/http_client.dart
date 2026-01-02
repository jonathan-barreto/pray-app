/// Abstract class defining HTTP client operations
abstract class HttpClient {
  /// Performs a GET request to the specified endpoint
  Future<HttpResponse> get({required String endpoint});

  /// Performs a POST request to the specified endpoint with the given body
  Future<HttpResponse> post({
    required String endpoint,
    required dynamic body,
  });

  /// Performs a PUT request to the specified endpoint with the given body
  Future<HttpResponse> put({
    required String endpoint,
    required dynamic body,
  });

  /// Performs a PATCH request to the specified endpoint with the given body
  Future<HttpResponse> patch({
    required String endpoint,
    required dynamic body,
  });
  
  /// Performs a DELETE request to the specified endpoint
  Future<HttpResponse> delete({
    required String endpoint,
    dynamic body,
  });
}

/// Class representing an HTTP response
class HttpResponse {
  /// Response data
  final dynamic data;
  
  /// HTTP status code
  final int? statusCode;
  
  /// HTTP status message
  final String? statusMessage;

  HttpResponse({
    required this.data,
    this.statusCode,
    this.statusMessage,
  });
  
  @override
  String toString() {
    return 'HttpResponse: {statusCode: $statusCode, statusMessage: $statusMessage}';
  }
}
