import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/domain/entities/token_entity.dart';

/// Interceptor to handle authentication tokens for HTTP requests
class TokenInterceptor extends Interceptor {
  /// List of endpoints that don't require authentication
  final List<String> _publicEndpoints = ['/user-login', '/user-register'];

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Skip token for public endpoints
    if (_publicEndpoints.any((endpoint) => options.path.contains(endpoint))) {
      debugPrint('Skipping token for public request: ${options.path}');
      return handler.next(options);
    }

    // Get token from app controller
    // Note: Implement your token storage mechanism here
    final TokenEntity? token = AppController.instance.token;

    if (token != null) {
      options.headers['Authorization'] = 'Bearer ${token.accessToken}';
      options.headers['x-user-token'] = token.accessToken;
      debugPrint('Adding tokens to request: ${options.path}');
      debugPrint('Authorization: Bearer ${token.accessToken}');
      debugPrint('x-user-token: ${token.accessToken}');
    } else {
      debugPrint('No token available for request: ${options.path}');
    }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      'TokenInterceptor onError: ${err.type} - ${err.response?.statusCode}',
    );

    // Handle authentication errors
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      debugPrint('TokenInterceptor: Authentication error detected');

      // You can implement token refresh logic here
      // If refresh fails, you can log the user out and redirect to login
      _handleAuthError();
    }

    handler.next(err);
  }

  /// Handle authentication errors
  /// This method can be implemented to refresh token or logout
  void _handleAuthError() {
    // Implement your authentication error handling logic here
    // For example:
    // 1. Try to refresh the token
    // 2. If refresh fails, logout the user
    // 3. Redirect to login screen
    debugPrint('Authentication error handler triggered');

    // Example: AppController.instance.logout();
  }
}
