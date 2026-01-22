import 'package:flutter/material.dart';

class VerifyResetCodeController extends ChangeNotifier {
  final TextEditingController codeController = TextEditingController();

  String? errorMessage;

  void validateCode() {
    _setError(null);

    final code = codeController.text.trim();

    if (code.isEmpty) {
      _setError('Digite o código de verificação');
      return;
    }

    if (code.length != 6) {
      _setError('O código deve ter 6 dígitos');
      return;
    }
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
    codeController.dispose();
    super.dispose();
  }
}
