import 'package:flutter/material.dart';
import 'package:pray_app/app/app_controller.dart';
import 'package:pray_app/app/domain/entities/login_response_entity.dart';
import 'package:pray_app/app/domain/entities/message_response_entity.dart';
import 'package:pray_app/app/domain/entities/token_entity.dart';
import 'package:pray_app/app/domain/params/login_params.dart';
import 'package:pray_app/app/domain/params/register_params.dart';
import 'package:pray_app/app/domain/usecases/login_usecase.dart';
import 'package:pray_app/app/domain/usecases/register_usecase.dart';
import 'package:pray_app/app/domain/usecases/save_token_usecase.dart';

class RegisterPageController extends ChangeNotifier {
  final RegisterUsecase _registerUsecase;
  final LoginUsecase _loginUsecase;
  final SaveTokenUsecase _saveTokenUsecase;

  RegisterPageController({
    required RegisterUsecase registerUsecase,
    required LoginUsecase loginUsecase,
    required SaveTokenUsecase saveTokenUsecase,
  })  : _registerUsecase = registerUsecase,
        _loginUsecase = loginUsecase,
        _saveTokenUsecase = saveTokenUsecase;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;
  bool registrationSuccess = false;

  Future<void> register({required String deviceToken}) async {
    _setLoading(true);
    _setError(null);
    _setRegistrationSuccess(false);

    final RegisterParams params = RegisterParams(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    final result = await _registerUsecase(params);

    MessageResponseEntity? responseEntity;

    result.get((failure) {
      debugPrint('Register failure: ${failure.message}');
      _setError(failure.message);
    }, (entity) => responseEntity = entity);

    if (responseEntity != null) {
      await _handleSuccess(responseEntity!, deviceToken);
    }

    _setLoading(false);
  }

  Future<void> _handleSuccess(
    MessageResponseEntity entity,
    String deviceToken,
  ) async {
    debugPrint('Register success: ${entity.message}');

    await _autoLogin(deviceToken);
  }

  Future<void> _autoLogin(String deviceToken) async {
    final LoginParams params = LoginParams(
      email: emailController.text,
      password: passwordController.text,
      deviceToken: deviceToken,
    );

    final result = await _loginUsecase(params);

    LoginResponseEntity? responseEntity;

    result.get((failure) {
      debugPrint('Auto-login failure: ${failure.message}');
      _setError(failure.message);
    }, (entity) => responseEntity = entity);

    if (responseEntity != null) {
      await _handleLoginSuccess(responseEntity!);
    }
  }

  Future<void> _handleLoginSuccess(LoginResponseEntity entity) async {
    final TokenEntity tokenEntity = entity.data;
    final result = await _saveTokenUsecase(tokenEntity);

    result.get(
      (failure) {
        _setError(
          failure.message ?? 'Não foi possível salvar os tokens localmente.',
        );
      },
      (_) {
        AppController.instance.setToken(tokenEntity);
        _setRegistrationSuccess(true);
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

  void _setRegistrationSuccess(bool value) {
    registrationSuccess = value;
    notifyListeners();
  }

  void clearError() {
    _setError(null);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
