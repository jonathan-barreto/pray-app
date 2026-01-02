---
trigger: always_on
---

# Dependency Injection (GetIt)

**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

## 1. Estrutura do DI
```dart
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  _registerGlobalServices();
  _registerDataSources();
  _registerRepositories();
  _registerUseCases();
  _registerControllers();
}
```

## 2. Registro de Dependências

**Serviços Globais (Singleton):**
```dart
void _registerGlobalServices() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<HttpClient>(
    () => HttpClientImpl(dio: getIt<Dio>(), useTokenInterceptor: true),
  );
  getIt.registerLazySingleton<SecureStorage>(
    () => SecureStorageImpl(storage: const FlutterSecureStorage()),
  );
}
```

**DataSources, Repositories, UseCases, Controllers (Factory):**
```dart
void _registerDataSources() {
  getIt.registerFactory<AuthDataSource>(
    () => AuthDataSourceImpl(httpClient: getIt<HttpClient>()),
  );
}

void _registerRepositories() {
  getIt.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: getIt<AuthDataSource>()),
  );
}

void _registerUseCases() {
  getIt.registerFactory<LoginUsecase>(
    () => LoginUsecase(repository: getIt<AuthRepository>()),
  );
}

void _registerControllers() {
  getIt.registerFactory<LoginPageController>(
    () => LoginPageController(loginUsecase: getIt<LoginUsecase>()),
  );
}
```
