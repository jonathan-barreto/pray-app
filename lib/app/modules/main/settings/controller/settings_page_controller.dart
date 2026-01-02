import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/core/routes/app_router.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/usecases/delete_token_usecase.dart';

class SettingsPageController extends ChangeNotifier {
  final DeleteTokenUsecase _deleteTokenUsecase;

  SettingsPageController({required DeleteTokenUsecase deleteTokenUsecase})
    : _deleteTokenUsecase = deleteTokenUsecase;

  bool isLoggingOut = false;
  String? errorMessage;

  Future<void> logout(BuildContext context) async {
    if (isLoggingOut) return;

    _setLoading(true);
    _setError(null);

    final result = await _deleteTokenUsecase(NoParams());

    result.get((failure) => _setError(failure.message), (_) {
      AppController.instance.logout();

      if (context.mounted) {
        GoRouter.of(context).go(AppRoutes.splash);
      }
    });

    _setLoading(false);
  }

  void _setLoading(bool value) {
    if (isLoggingOut == value) return;
    isLoggingOut = value;
    notifyListeners();
  }

  void _setError(String? value) {
    if (errorMessage == value) return;
    errorMessage = value;
    notifyListeners();
  }

  void clearError() {
    _setError(null);
  }
}
