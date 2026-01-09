import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/domain/entities/login_response_entity.dart';
import 'package:pray_app/app/domain/entities/token_entity.dart';
import 'package:pray_app/app/domain/params/login_params.dart';
import 'package:pray_app/app/domain/usecases/login_usecase.dart';
import 'package:pray_app/app/domain/usecases/save_token_usecase.dart';

class LoginPageController extends ChangeNotifier {
  final LoginUsecase _loginUsecase;
  final SaveTokenUsecase _saveTokenUsecase;

  LoginPageController({
    required LoginUsecase loginUsecase,
    required SaveTokenUsecase saveTokenUsecase,
  }) : _loginUsecase = loginUsecase,
       _saveTokenUsecase = saveTokenUsecase;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController(
    text: kDebugMode ? 'jonathan777barreto@gmail.com' : null,
  );

  final TextEditingController passwordController = TextEditingController(
    text: kDebugMode ? 'senhaSegura1234' : null,
  );

  bool isLoading = false;
  String? errorMessage;

  Future<void> login({required String deviceToken}) async {
    _setLoading(true);
    _setError(null);

    final LoginParams params = LoginParams(
      email: emailController.text,
      password: passwordController.text,
      deviceToken: deviceToken,
    );

    final result = await _loginUsecase(params);

    LoginResponseEntity? responseEntity;

    result.get((failure) {
      debugPrint('Login failure: ${failure.message}');
      _setError(failure.message);
    }, (entity) => responseEntity = entity);

    if (responseEntity != null) {
      await _handleSuccess(responseEntity!);
    }

    _setLoading(false);
  }

  Future<void> _handleSuccess(LoginResponseEntity entity) async {
    // Salvar token no SecureStorage
    final TokenEntity tokenEntity = entity.data;
    final result = await _saveTokenUsecase(tokenEntity);

    result.get(
      (failure) {
        _setError(
          failure.message ?? 'Não foi possível salvar os tokens localmente.',
        );
      },
      (_) {
        // Setar token no AppController para uso nos interceptors
        AppController.instance.setToken(tokenEntity);
      },
    );
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    debugPrint('Setting error message: $value');
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
