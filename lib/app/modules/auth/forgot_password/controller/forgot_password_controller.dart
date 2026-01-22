import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/params/password_reset_request_params.dart';
import 'package:pray_app/app/domain/usecases/password_reset_request_usecase.dart';

class ForgotPasswordController extends ChangeNotifier {
  final PasswordResetRequestUsecase _requestUsecase;

  ForgotPasswordController({
    required PasswordResetRequestUsecase requestUsecase,
  }) : _requestUsecase = requestUsecase;

  final TextEditingController emailController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;

  Future<void> requestPasswordReset() async {
    _setLoading(true);
    _setError(null);
    _setSuccess(null);

    final PasswordResetRequestParams params = PasswordResetRequestParams(
      email: emailController.text.trim(),
    );

    final result = await _requestUsecase(params);

    result.get(
      (failure) => _setError(failure.message),
      (response) => _setSuccess(response.message),
    );

    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    errorMessage = value;
    notifyListeners();
  }

  void _setSuccess(String? value) {
    successMessage = value;
    notifyListeners();
  }

  void clearError() {
    _setError(null);
  }

  void clearSuccess() {
    _setSuccess(null);
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
