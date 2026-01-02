import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/params/password_update_params.dart';
import 'package:pray_app/app/domain/usecases/update_password_usecase.dart';

class PasswordUpdateController extends ChangeNotifier {
  final UpdatePasswordUsecase _updatePasswordUsecase;

  PasswordUpdateController({
    required UpdatePasswordUsecase updatePasswordUsecase,
  }) : _updatePasswordUsecase = updatePasswordUsecase;

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool obscureCurrentPassword = true;
  bool obscureNewPassword = true;
  bool obscureConfirmPassword = true;
  bool isLoading = false;
  String? errorMessage;

  void toggleCurrentPasswordVisibility() {
    obscureCurrentPassword = !obscureCurrentPassword;
    notifyListeners();
  }

  void toggleNewPasswordVisibility() {
    obscureNewPassword = !obscureNewPassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  Future<bool> updatePassword() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return false;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      _setError('As senhas não coincidem');
      return false;
    }

    _setLoading(true);
    _setError(null);

    final PasswordUpdateParams params = PasswordUpdateParams(
      currentPassword: currentPasswordController.text,
      newPassword: newPasswordController.text,
    );

    final result = await _updatePasswordUsecase(params);

    bool success = false;
    result.get((failure) => _setError(failure.message), (_) => success = true);

    _setLoading(false);
    return success;
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    errorMessage = value;
    notifyListeners();
  }

  void clearError() {
    _setError(null);
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
