import 'package:flutter/material.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/domain/params/email_update_params.dart';
import 'package:pray_app/app/domain/usecases/update_email_usecase.dart';

class EmailUpdateController extends ChangeNotifier {
  final UpdateEmailUsecase _updateEmailUsecase;

  EmailUpdateController({required UpdateEmailUsecase updateEmailUsecase})
    : _updateEmailUsecase = updateEmailUsecase;

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(
    text: AppController.instance.userProfile?.email,
  );
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;
  String? errorMessage;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<bool> updateEmail() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return false;
    }

    _setLoading(true);
    _setError(null);

    final EmailUpdateParams params = EmailUpdateParams(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    final result = await _updateEmailUsecase(params);

    bool success = false;
    result.get((failure) => _setError(failure.message), (profileResponse) {
      AppController.instance.setUserProfile(profileResponse.data);
      success = true;
    });

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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
