---
trigger: always_on
---

# Estrutura e Organização

**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

## 1. Um Conceito por Arquivo
- **Regra:** Cada arquivo deve conter **apenas uma classe, interface ou conceito principal**.
- **Exemplos:**
  - `token_model.dart` → contém apenas `TokenModel`
  - `token_entity.dart` → contém apenas `TokenEntity`
  - `token_mapper.dart` → contém apenas `TokenMapper`
  - `login_usecase.dart` → contém apenas `LoginUsecase`

## 2. Estrutura de Diretórios
```
lib/app/
├── core/                   # Funcionalidades compartilhadas
│   ├── consts/             # Constantes (endpoints, assets, colors, texts)
│   ├── either/             # Tipo Either para tratamento de erros
│   ├── errors/             # Exceções e Failures
│   ├── http_client/        # Cliente HTTP e interceptors
│   ├── routes/             # Configuração de rotas (GoRouter)
│   ├── secure_storage/     # Armazenamento seguro (abstração + impl)
│   ├── theme/              # Tema da aplicação
│   ├── usecase/            # Interface base para use cases
│   ├── utils/              # Utilitários gerais
│   └── widgtes/            # Widgets compartilhados
├── data/                   # Camada de dados
│   ├── datasources/        # Fontes de dados (remote/local)
│   ├── models/             # DTOs (Data Transfer Objects)
│   └── repositories/       # Implementações de repositórios
├── domain/                 # Camada de domínio
│   ├── entities/           # Objetos de negócio puros
│   ├── mappers/            # Conversores Model ↔ Entity
│   ├── params/             # Parâmetros de use cases
│   ├── repositories/       # Interfaces de repositórios
│   └── usecases/           # Casos de uso (regras de negócio)
├── modules/                # Módulos de features
│   └── [feature]/
│       ├── controller/     # Gerenciamento de estado (ChangeNotifier)
│       ├── page/           # Telas principais
│       └── widgets/        # Componentes específicos da feature
├── di/                     # Dependency Injection (GetIt)
└── app_controller.dart     # Controlador global da aplicação
```
