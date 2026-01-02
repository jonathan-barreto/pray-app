import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Enum representing different types of HTTP exceptions
enum HttpExceptionType {
  /// Connection-related errors (network issues, timeouts)
  connection,

  /// Authentication/authorization errors (401, 403, etc.)
  authentication,

  /// Server errors (500, etc.)
  server,

  /// Client errors (400, 404, etc.)
  client,

  /// Data parsing/validation errors
  parsing,

  /// Unknown or unspecified errors
  generic,
}

/// Exception class for HTTP-related errors
class HttpException implements Exception {
  final HttpExceptionType type;
  final String? message;
  final int? statusCode;
  final dynamic data;
  final DioException? originalError;

  HttpException({
    required this.type,
    this.message,
    this.statusCode,
    this.data,
    this.originalError,
  });

  /// Helper method to extract error message from response data
  static String? _extractErrorMessage(dynamic responseData) {
    if (responseData == null) return null;

    // Caso 1: resposta direta com campo message
    if (responseData is Map && responseData['message'] != null) {
      return responseData['message'].toString();
    }

    // Caso 2: resposta em formato de string JSON
    if (responseData is String) {
      try {
        final Map<String, dynamic> jsonData = jsonDecode(responseData);
        if (jsonData['message'] != null) {
          return jsonData['message'].toString();
        }
      } catch (_) {}
    }

    // Caso 3: resposta é um objeto com toString() útil
    if (responseData is! Map && responseData is! List) {
      return responseData.toString();
    }

    return null;
  }

  /// Factory constructor to prepare an HttpException from a DioException
  factory HttpException.prepare(DioException err) {
    try {
      // Authentication errors
      if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
        // Extrair mensagem diretamente da resposta
        String? errorMessage = _extractErrorMessage(err.response?.data);
        debugPrint('Authentication error message extracted: $errorMessage');

        return HttpException(
          type: HttpExceptionType.authentication,
          message:
              errorMessage ??
              err.response?.statusMessage ??
              'Authentication error',
          statusCode: err.response?.statusCode,
          data: err.response?.data,
          originalError: err,
        );
      }

      // Bad request errors
      if (err.response?.statusCode == 400 ||
          err.response?.statusCode == 422 ||
          err.response?.statusCode == 404) {
        return HttpException(
          type: HttpExceptionType.client,
          message:
              _extractErrorMessage(err.response?.data) ??
              err.response?.statusMessage ??
              'Client request error',
          statusCode: err.response?.statusCode,
          data: err.response?.data,
          originalError: err,
        );
      }

      // Server errors
      if (err.response?.statusCode != null &&
          err.response!.statusCode! >= 500) {
        return HttpException(
          type: HttpExceptionType.server,
          message:
              _extractErrorMessage(err.response?.data) ??
              err.response?.statusMessage ??
              'Server error',
          statusCode: err.response?.statusCode,
          data: err.response?.data,
          originalError: err,
        );
      }

      // Connection errors
      if (err.type == DioExceptionType.connectionError ||
          err.type == DioExceptionType.connectionTimeout ||
          err.type == DioExceptionType.receiveTimeout ||
          err.type == DioExceptionType.sendTimeout) {
        return HttpException(
          type: HttpExceptionType.connection,
          message: 'Connection error: ${err.message}',
          originalError: err,
        );
      }

      // Response parsing errors
      if (err.type == DioExceptionType.badResponse) {
        return HttpException(
          type: HttpExceptionType.parsing,
          message:
              _extractErrorMessage(err.response?.data) ??
              'Error parsing response: ${err.message}',
          statusCode: err.response?.statusCode,
          data: err.response?.data,
          originalError: err,
        );
      }

      // Generic errors
      return HttpException(
        type: HttpExceptionType.generic,
        message:
            _extractErrorMessage(err.response?.data) ??
            err.message ??
            'Unknown error occurred',
        statusCode: err.response?.statusCode,
        data: err.response?.data,
        originalError: err,
      );
    } catch (e) {
      return HttpException(
        type: HttpExceptionType.generic,
        message: 'Error processing exception: $e',
      );
    }
  }

  @override
  String toString() {
    return 'HttpException: {type: $type, message: $message, statusCode: $statusCode}';
  }
}

/// Exception class for secure storage related errors
class SecureStorageException implements Exception {
  final String? message;
  final dynamic error;

  SecureStorageException({this.message, this.error});

  @override
  String toString() {
    return 'SecureStorageException: $message';
  }
}
