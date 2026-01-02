---
trigger: always_on
---

# Modelos Aninhados

**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

## 1. Regra de Separação

Quando um modelo/entity contém um objeto aninhado (ex: `data: { token, refresh_token }`), **sempre** criar arquivos separados:

**Estrutura:**

```
data/models/
  ├── login_response_model.dart  → LoginResponseModel
  └── token_model.dart            → TokenModel

domain/entities/
  ├── login_response_entity.dart  → LoginResponseEntity
  └── token_entity.dart           → TokenEntity

domain/mappers/
  ├── login_response_mapper.dart  → LoginResponseMapper
  └── token_mapper.dart           → TokenMapper
```

**Exemplo:**

```dart
// token_model.dart
class TokenModel {
  final String token;
  final String refreshToken;
  // ...
}

// login_response_model.dart
import 'package:pray_app/app/data/models/token_model.dart';

class LoginResponseModel {
  final bool success;
  final TokenModel data;  // ← Nested model
  final String message;
  // ...
}
```
