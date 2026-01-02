---
trigger: always_on
---

# Formatação e Estilo

**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

## 1. Imports

- Ordem de imports:
  1. `dart:*` (core Dart)
  2. `package:flutter/*` (Flutter)
  3. `package:third_party/*` (Pacotes externos)
  4. `package:pray_app/*` (Projeto)
- Linha em branco entre grupos
- Sem imports não utilizados

**Exemplo:**

```dart
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:pray_app/app/core/http_client/http_client.dart';
import 'package:pray_app/app/domain/entities/login_response_entity.dart';
```

## 2. Espaçamento

- Linha em branco após imports
- Linha em branco entre métodos
- Linha em branco entre blocos lógicos dentro de métodos
- Sem múltiplas linhas em branco consecutivas

## 3. Comentários

- **Evitar** comentários desnecessários
- Código deve ser autoexplicativo
- Usar comentários apenas para:
  - Documentação de classes públicas (quando necessário)
  - Explicar lógica complexa não óbvia
  - TODOs temporários

## 4. Construtores

- Named parameters com `required` quando obrigatório
- Initializer list para atribuições:
  ```dart
  LoginPageController({required LoginUsecase loginUsecase})
    : _loginUsecase = loginUsecase;
  ```
