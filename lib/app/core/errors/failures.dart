import 'package:flutter/foundation.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/core/errors/exceptions.dart';

/// Enum representing different types of failures in the application
enum FailureType {
  /// Connection-related failures
  connection,

  /// Authentication/authorization failures
  authentication,

  /// Server-related failures
  server,

  /// Client-related failures (bad requests, etc.)
  client,

  /// Data parsing/validation failures
  parsing,

  /// Unknown or unspecified failures
  generic,
}

/// Class representing a failure in the application
/// Used in the domain layer to abstract platform-specific exceptions
class Failure {
  /// Type of the failure
  final FailureType typeError;

  /// Message describing the failure
  final String? message;

  /// Status code if applicable
  final int? statusCode;

  /// Additional data related to the failure
  final dynamic data;

  Failure({required this.typeError, this.message, this.statusCode, this.data});

  /// Factory constructor to create a Failure from an HttpException
  factory Failure.fromHttpException(HttpException err) {
    debugPrint('HttpException: ${err.type} - ${err.message}');
    debugPrint('HttpException data: ${err.data}');

    // Garantir que estamos usando a mensagem de erro correta
    String? errorMessage = err.message;
    debugPrint('Using error message: $errorMessage');

    switch (err.type) {
      case HttpExceptionType.authentication:
        return Failure(
          typeError: FailureType.authentication,
          message:
              errorMessage ?? AppController.instance.appTexts.notAuthenticated,
          statusCode: err.statusCode,
          data: err.data,
        );
      case HttpExceptionType.connection:
        return Failure(
          typeError: FailureType.connection,
          message: errorMessage ?? AppController.instance.appTexts.noConnection,
        );
      case HttpExceptionType.server:
        return Failure(
          typeError: FailureType.server,
          message:
              errorMessage ??
              AppController.instance.appTexts.serverErrorMessage,
          statusCode: err.statusCode,
          data: err.data,
        );
      case HttpExceptionType.client:
        return Failure(
          typeError: FailureType.client,
          message:
              errorMessage ?? AppController.instance.appTexts.invalidRequest,
          statusCode: err.statusCode,
          data: err.data,
        );
      case HttpExceptionType.parsing:
        return Failure(
          typeError: FailureType.parsing,
          message: errorMessage ?? AppController.instance.appTexts.parsingError,
          data: err.data,
        );
      case HttpExceptionType.generic:
        return Failure(
          typeError: FailureType.generic,
          message: errorMessage ?? AppController.instance.appTexts.genericError,
          statusCode: err.statusCode,
          data: err.data,
        );
    }
  }

  /// Factory constructor to create a Failure from a SecureStorageException
  factory Failure.fromSecureStorageException(SecureStorageException err) {
    debugPrint('SecureStorageException: ${err.message}');
    return Failure(
      typeError: FailureType.generic,
      message: err.message ?? 'Erro no armazenamento seguro',
      data: err.error,
    );
  }

  /// Factory constructor for general exceptions
  factory Failure.fromException(Exception err) {
    debugPrint('Exception: $err');
    return Failure(typeError: FailureType.generic, message: err.toString());
  }

  @override
  String toString() {
    return 'Failure: {type: $typeError, message: $message, statusCode: $statusCode}';
  }
}
