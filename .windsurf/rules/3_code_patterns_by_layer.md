---
trigger: always_on
---

# Padrões de Código por Camada

**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

## 1. Models (Data Layer)

**Características:**

- Sempre incluir `fromJson`, `fromMap`, `toMap`, `toJson`
- Usar `const` constructor quando possível
- Campos `final`
- Operador `??` para valores padrão em `fromMap`
- Nunca criar pasta para criar models... sempre criar os arquivos na raiz lib\app\data\models

**Template:**

```dart
import 'dart:convert';

class TokenModel {
  final String token;
  final String refreshToken;

  const TokenModel({required this.token, required this.refreshToken});

  factory TokenModel.fromJson(String source) {
    return TokenModel.fromMap(jsonDecode(source));
  }

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      token: map['token'] ?? '',
      refreshToken: map['refresh_token'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'token': token, 'refresh_token': refreshToken};
  }

  String toJson() => jsonEncode(toMap());
}
```

## 2. Entities (Domain Layer)

**Características:**

- Classes puras sem lógica de serialização
- `const` constructor
- Campos `final`
- Sem dependências externas (apenas Dart puro)
- Nunca criar pasta para criar entities... sempre criar os arquivos na raiz

**Template:**

```dart
class TokenEntity {
  final String token;
  final String refreshToken;

  const TokenEntity({required this.token, required this.refreshToken});
}
```

## 3. Mappers (Domain Layer)

**Características:**

- Métodos `static`
- `fromModel` (Model → Entity)
- `fromEntity` (Entity → Model)
- Sem estado interno
- Nunca criar pasta para criar Mappers ... sempre criar os arquivos na raiz

**Template:**

```dart
import 'package:pray_app/app/data/models/token_model.dart';
import 'package:pray_app/app/domain/entities/token_entity.dart';

class TokenMapper {
  static TokenEntity fromModel(TokenModel model) {
    return TokenEntity(
      token: model.token,
      refreshToken: model.refreshToken,
    );
  }

  static TokenModel fromEntity(TokenEntity entity) {
    return TokenModel(
      token: entity.token,
      refreshToken: entity.refreshToken,
    );
  }
}
```

## 4. Params (Domain Layer)

**Características:**

- `const` constructor
- `toMap()` e `toJson()` para serialização de requisições
- Campos `final`
- Nunca criar pasta para criar Params ... sempre criar os arquivos na raiz

**Template:**

```dart
import 'dart:convert';

class LoginParams {
  final String email;
  final String password;
  final String deviceToken;

  const LoginParams({
    required this.email,
    required this.password,
    required this.deviceToken,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'device_token': deviceToken,
    };
  }

  String toJson() => jsonEncode(toMap());
}
```

## 5. Repository Interfaces (Domain Layer)

**Características:**

- `abstract class`
- Retorna `Future<EitherOf<Failure, Entity>>`
- Named parameters com `required`
- Nunca criar pasta para criar Repository ... sempre criar os arquivos na raiz

**Template:**

```dart
import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/domain/entities/login_response_entity.dart';
import 'package:pray_app/app/domain/params/login_params.dart';

abstract class AuthRepository {
  Future<EitherOf<Failure, LoginResponseEntity>> login({
    required LoginParams params,
  });
}
```

## 6. Repository Implementations (Data Layer)

**Características:**

- Implementa interface do domínio
- Injeta datasource via construtor
- Try-catch com `HttpException` e genérico
- Usa mapper para converter Model → Entity
- Retorna `Resolve` (sucesso) ou `Reject` (falha)
- Nunca criar pasta para criar Repository ... sempre criar os arquivos na raiz

**Template:**

```dart
import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/exceptions.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/data/datasources/auth_datasource.dart';
import 'package:pray_app/app/data/models/login_response_model.dart';
import 'package:pray_app/app/domain/entities/login_response_entity.dart';
import 'package:pray_app/app/domain/mappers/login_response_mapper.dart';
import 'package:pray_app/app/domain/params/login_params.dart';
import 'package:pray_app/app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _remoteDataSource;

  AuthRepositoryImpl({required AuthDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  @override
  Future<EitherOf<Failure, LoginResponseEntity>> login({
    required LoginParams params,
  }) async {
    try {
      final LoginResponseModel responseModel = await _remoteDataSource.login(
        param: params,
      );

      final LoginResponseEntity responseEntity = LoginResponseMapper.fromModel(
          responseModel);

      return Resolve(responseEntity);
    } on HttpException catch (e) {
      return Reject(Failure.fromHttpException(e));
    } catch (e) {
      return Reject(
        Failure(typeError: FailureType.generic, message: e.toString()),
      );
    }
  }
}
```

## 7. DataSources (Data Layer)

**Características:**

- Interface abstrata + implementação
- Injeta `HttpClient` ou `SecureStorage`
- Usa `.fromJson()` para parsear respostas
- `rethrow` em catch para propagar exceções
- Nunca criar pasta para criar DataSources ... sempre criar os arquivos na raiz

**Template:**

```dart
import 'package:pray_app/app/core/consts/app_endpoints.dart';
import 'package:pray_app/app/core/http_client/http_client.dart';
import 'package:pray_app/app/data/models/login_response_model.dart';
import 'package:pray_app/app/domain/params/login_params.dart';

abstract class AuthDataSource {
  Future<LoginResponseModel> login({required LoginParams param});
}

class AuthDataSourceImpl implements AuthDataSource {
  final HttpClient _httpClient;

  AuthDataSourceImpl({required HttpClient httpClient})
    : _httpClient = httpClient;

  @override
  Future<LoginResponseModel> login({required LoginParams param}) async {
    try {
      final HttpResponse response = await _httpClient.post(
        endpoint: AppEndpoints.login,
        body: param.toMap(),
      );

      return LoginResponseModel.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
```

## 8. Use Cases (Domain Layer)

**Características:**

- Implementa `Usecase<ReturnType, ParamsType>`
- Injeta repositório via construtor
- Método `call` delega para repositório
- Retorna `Future<EitherOf<Failure, Entity>>`
- Nunca criar pasta para criar Use Cases ... sempre criar os arquivos na raiz

**Template:**

```dart
import 'package:pray_app/app/core/either/either_of.dart';
import 'package:pray_app/app/core/errors/failures.dart';
import 'package:pray_app/app/core/usecase/usecase.dart';
import 'package:pray_app/app/domain/entities/login_response_entity.dart';
import 'package:pray_app/app/domain/params/login_params.dart';
import 'package:pray_app/app/domain/repositories/auth_repository.dart';

class LoginUsecase implements Usecase<LoginResponseEntity, LoginParams> {
  final AuthRepository _repository;

  LoginUsecase({required AuthRepository repository}) : _repository = repository;

  @override
  Future<EitherOf<Failure, LoginResponseEntity>> call(
    LoginParams params,
  ) async {
    return await _repository.login(params: params);
  }
}
```

## 9. Controllers (Module Layer)

**Características:**

- Estende `ChangeNotifier`
- Injeta use cases via construtor
- Estado privado com setters privados (`_setLoading`, `_setError`)
- Métodos públicos para ações (ex: `login`, `clearError`)
- `dispose()` para limpar recursos (controllers, listeners)
- Sempre chamar `notifyListeners()` após mudança de estado

**Template:**

```dart
import 'package:flutter/material.dart';
import 'package:pray_app/app/domain/entities/login_response_entity.dart';
import 'package:pray_app/app/domain/params/login_params.dart';
import 'package:pray_app/app/domain/usecases/login_usecase.dart';

class LoginPageController extends ChangeNotifier {
  final LoginUsecase _loginUsecase;

  LoginPageController({required LoginUsecase loginUsecase})
    : _loginUsecase = loginUsecase;

  bool isLoading = false;
  String? errorMessage;

  Future<void> login({required String deviceToken}) async {
    _setLoading(true);
    _setError(null);

    final LoginParams params = LoginParams(
      email: 'user@example.com',
      password: 'password',
      deviceToken: deviceToken,
    );

    final result = await _loginUsecase(params);

    result.get((failure) => _setError(failure.message), _handleSuccess);

    _setLoading(false);
  }

  void _handleSuccess(LoginResponseEntity entity) {
    // Handle success logic
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
    // Dispose resources
    super.dispose();
  }
}
```

## 10. Pages (Module Layer)

**Características:**

- `StatefulWidget` quando precisa de estado local
- Injeta controller via `getIt` no `initState`
- Usa `ListenableBuilder` para reagir a mudanças do controller
- Métodos de ação privados (ex: `_loginOnPressed`)
- Sempre verificar `mounted` após `await` em métodos async
- Usar `ScaffoldMessenger` para feedback de erro/sucesso
- `dispose()` para limpar controller

**Template:**

```dart
import 'package:flutter/material.dart';
import 'package:pray_app/app/di/di.dart';
import 'package:pray_app/app/modules/auth/login/controller/login_page_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late final LoginPageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = getIt<LoginPageController>();
  }

  Future<void> _loginOnPressed() async {
    if (_controller.isLoading) {
      return;
    }

    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();

      await _controller.login(deviceToken: 'device_token');

      if (!mounted) {
        return;
      }

      if (_controller.errorMessage != null) {
        ScaffoldMessenger.of(context)
          ..clearSnackBars()
          ..showSnackBar(
            SnackBar(content: Text(_controller.errorMessage!)),
          );

        _controller.clearError();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          return Column(
            children: [
              // UI components
            ],
          );
        },
      ),
    );
  }
}
```
