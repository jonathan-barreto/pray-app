import 'package:pray_app/app/core/consts/app_endpoints.dart';
import 'package:pray_app/app/core/http_client/http_client.dart';
import 'package:pray_app/app/data/models/password_reset_response_model.dart';
import 'package:pray_app/app/domain/params/password_reset_confirm_params.dart';
import 'package:pray_app/app/domain/params/password_reset_request_params.dart';

abstract class PasswordResetDataSource {
  Future<PasswordResetResponseModel> requestReset({
    required PasswordResetRequestParams params,
  });

  Future<PasswordResetResponseModel> confirmReset({
    required PasswordResetConfirmParams params,
  });
}

class PasswordResetDataSourceImpl implements PasswordResetDataSource {
  final HttpClient _httpClient;

  PasswordResetDataSourceImpl({required HttpClient httpClient})
      : _httpClient = httpClient;

  @override
  Future<PasswordResetResponseModel> requestReset({
    required PasswordResetRequestParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.passwordResetRequest,
        body: params.toMap(),
      );

      return PasswordResetResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<PasswordResetResponseModel> confirmReset({
    required PasswordResetConfirmParams params,
  }) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.passwordResetConfirm,
        body: params.toMap(),
      );

      return PasswordResetResponseModel.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
