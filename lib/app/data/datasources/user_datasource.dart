import 'dart:convert';

import 'package:pray_app/app/core/consts/app_endpoints.dart';
import 'package:pray_app/app/core/http_client/http_client.dart';
import 'package:pray_app/app/data/models/login_response_model.dart';
import 'package:pray_app/app/data/models/message_response_model.dart';
import 'package:pray_app/app/data/models/user_metrics_response_model.dart';
import 'package:pray_app/app/data/models/user_response_model.dart';
import 'package:pray_app/app/domain/params/email_update_params.dart';
import 'package:pray_app/app/domain/params/login_params.dart';
import 'package:pray_app/app/domain/params/password_update_params.dart';
import 'package:pray_app/app/domain/params/profile_update_params.dart';
import 'package:pray_app/app/domain/params/register_params.dart';
import 'package:pray_app/app/domain/params/user_delete_params.dart';

abstract class UserDataSource {
  Future<UserResponseModel> getUser();

  Future<UserMetricsResponseModel> getUserMetrics({required String userId});

  Future<MessageResponseModel> registerUser({required RegisterParams params});

  Future<LoginResponseModel> loginUser({required LoginParams params});

  Future<UserResponseModel> updateUserProfile({
    required ProfileUpdateParams params,
  });

  Future<UserResponseModel> updateUserEmail({
    required EmailUpdateParams params,
  });

  Future<MessageResponseModel> updateUserPassword({
    required PasswordUpdateParams params,
  });

  Future<MessageResponseModel> deleteUser({required UserDeleteParams params});
}

class UserDataSourceImpl implements UserDataSource {
  final HttpClient _httpClient;

  UserDataSourceImpl({required HttpClient httpClient})
    : _httpClient = httpClient;

  @override
  Future<UserResponseModel> getUser() async {
    try {
      final HttpResponse response = await _httpClient.get(
        endpoint: AppEndpoints.user,
      );

      return UserResponseModel.fromMap(jsonDecode(response.data));
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<UserMetricsResponseModel> getUserMetrics({
    required String userId,
  }) async {
    try {
      final HttpResponse response = await _httpClient.get(
        endpoint: '${AppEndpoints.userMetrics}/$userId',
      );

      return UserMetricsResponseModel.fromMap(jsonDecode(response.data));
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<MessageResponseModel> registerUser({
    required RegisterParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.userRegister,
        body: params.toMap(),
      );

      return MessageResponseModel.fromMap(jsonDecode(response.data));
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<LoginResponseModel> loginUser({required LoginParams params}) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.userLogin,
        body: params.toMap(),
      );

      return LoginResponseModel.fromMap(jsonDecode(response.data));
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<UserResponseModel> updateUserProfile({
    required ProfileUpdateParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.put(
        endpoint: AppEndpoints.userProfileUpdate,
        body: params.toMap(),
      );

      return UserResponseModel.fromMap(jsonDecode(response.data));
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<UserResponseModel> updateUserEmail({
    required EmailUpdateParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.put(
        endpoint: AppEndpoints.userEmailUpdate,
        body: params.toMap(),
      );

      return UserResponseModel.fromMap(jsonDecode(response.data));
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<MessageResponseModel> updateUserPassword({
    required PasswordUpdateParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.put(
        endpoint: AppEndpoints.userPasswordUpdate,
        body: params.toMap(),
      );

      return MessageResponseModel.fromMap(jsonDecode(response.data));
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<MessageResponseModel> deleteUser({
    required UserDeleteParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.delete(
        endpoint: AppEndpoints.userDelete,
        body: params.toMap(),
      );

      return MessageResponseModel.fromMap(jsonDecode(response.data));
    } catch (err) {
      rethrow;
    }
  }
}
