import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/params/password_reset_confirm_params.dart';
import 'package:pray_app/app/domain/usecases/password_reset_confirm_usecase.dart';

class ResetPasswordController extends ChangeNotifier {
  final PasswordResetConfirmUsecase _confirmUsecase;

  ResetPasswordController({
    required PasswordResetConfirmUsecase confirmUsecase,
  }) : _confirmUsecase = confirmUsecase;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;
  String? errorMessage;
  String? successMessage;

  Future<void> resetPassword({
    required String email,
    required String code,
  }) async {
    _setLoading(true);
    _setError(null);
    _setSuccess(null);

    final PasswordResetConfirmParams params = PasswordResetConfirmParams(
      email: email,
      code: code,
      newPassword: passwordController.text.trim(),
    );

    final result = await _confirmUsecase(params);

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
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
