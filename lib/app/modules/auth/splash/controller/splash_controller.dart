import 'package:flutter/foundation.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/token_entity.dart';
import 'package:pray_app/app/domain/usecases/get_token_usecase.dart';
import 'package:pray_app/app/domain/usecases/get_user_usecase.dart';

class SplashController extends ChangeNotifier {
  final GetTokenUsecase _getTokenUsecase;
  final GetUserUsecase _getUserUsecase;

  SplashController({
    required GetTokenUsecase getTokenUsecase,
    required GetUserUsecase getUserUsecase,
  }) : _getTokenUsecase = getTokenUsecase,
       _getUserUsecase = getUserUsecase;

  bool hasProfileError = false;

  Future<void> loadToken() async {
    final result = await _getTokenUsecase(NoParams());

    result.get((_) => _setToken(null), (token) {
      final bool isValid =
          token != null &&
          token.accessToken.isNotEmpty &&
          token.refreshToken.isNotEmpty;

      _setToken(isValid ? token : null);
    });
  }

  Future<void> loadProfile() async {
    hasProfileError = false;

    final result = await _getUserUsecase(NoParams());

    result.get(
      (failure) {
        hasProfileError = true;
        notifyListeners();
      },
      (userEntity) {
        AppController.instance.setUserProfile(userEntity.data);
        notifyListeners();
      },
    );
  }

  void _setToken(TokenEntity? token) {
    if (token != null) {
      AppController.instance.setToken(token);
    }

    notifyListeners();
  }
}
