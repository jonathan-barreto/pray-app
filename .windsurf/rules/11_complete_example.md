---
trigger: always_on
---

# Exemplo Completo: Feature de Login

**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

## 1. Estrutura de Arquivos
```
lib/app/
├── data/
│   ├── datasources/
│   │   └── auth_datasource.dart
│   ├── models/
│   │   ├── login_response_model.dart
│   │   └── token_model.dart
│   └── repositories/
│       └── auth_repository_impl.dart
├── domain/
│   ├── entities/
│   │   ├── login_response_entity.dart
│   │   └── token_entity.dart
│   ├── mappers/
│   │   ├── login_response_mapper.dart
│   │   └── token_mapper.dart
│   ├── params/
│   │   └── login_params.dart
│   ├── repositories/
│   │   └── auth_repository.dart
│   └── usecases/
│       └── login_usecase.dart
└── modules/
    └── auth/
        └── login/
            ├── controller/
            │   └── login_page_controller.dart
            ├── page/
            │   └── login_page.dart
            └── widgets/
                ├── login_header.dart
                └── login_form.dart
```

## 2. Fluxo de Dados
```
UI (LoginPage)
  ↓ chama
Controller (LoginPageController)
  ↓ chama
UseCase (LoginUsecase)
  ↓ chama
Repository Interface (AuthRepository)
  ↓ implementado por
Repository Impl (AuthRepositoryImpl)
  ↓ chama
DataSource (AuthDataSource)
  ↓ usa
HttpClient
  ↓ retorna
Model (LoginResponseModel)
  ↓ mapeado por
Mapper (LoginResponseMapper)
  ↓ retorna
Entity (LoginResponseEntity)
  ↓ retorna via EitherOf
Controller
  ↓ notifica
UI (rebuild)
```
