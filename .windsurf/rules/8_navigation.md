---
trigger: always_on
---

# Navegação

**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

## 1. Usar GoRouter Exclusivamente
- **Nunca** usar `Navigator` diretamente
- Sempre usar `GoRouter` diretamente (não via context):
  ```dart
  GoRouter.of(context).go('/login');
  GoRouter.of(context).push('/details');
  GoRouter.of(context).pop();
  ```
