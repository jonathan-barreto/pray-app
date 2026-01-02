---
trigger: always_on
---

# Convenções de Nomenclatura

**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

## 1. Arquivos
- **snake_case** para nomes de arquivos
- Sufixos descritivos:
  - Models: `*_model.dart` (ex: `token_model.dart`)
  - Entities: `*_entity.dart` (ex: `token_entity.dart`)
  - Mappers: `*_mapper.dart` (ex: `token_mapper.dart`)
  - Params: `*_params.dart` (ex: `login_params.dart`)
  - Usecases: `*_usecase.dart` (ex: `login_usecase.dart`)
  - Repositories (interface): `*_repository.dart` (ex: `auth_repository.dart`)
  - Repositories (impl): `*_repository_impl.dart` (ex: `auth_repository_impl.dart`)
  - Datasources (interface): `*_datasource.dart` (ex: `auth_datasource.dart`)
  - Controllers: `*_controller.dart` (ex: `login_page_controller.dart`)
  - Pages: `*_page.dart` (ex: `login_page.dart`)

## 2. Classes
- **PascalCase** para nomes de classes
- Sufixos descritivos correspondentes ao tipo:
  ```dart
  class TokenModel { }
  class TokenEntity { }
  class TokenMapper { }
  class LoginParams { }
  class LoginUsecase { }
  class AuthRepository { }
  class AuthRepositoryImpl { }
  class LoginPageController { }
  ```

## 3. Variáveis e Parâmetros
- **camelCase** para variáveis locais e parâmetros
- Prefixo `_` para membros privados
- Tipo explícito quando melhora legibilidade:
  ```dart
  final LoginParams params = LoginParams(...);
  final AuthDataSource _remoteDataSource;
  bool isLoading = false;
  String? errorMessage;
  ```
