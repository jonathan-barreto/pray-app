---
trigger: always_on
---

# Tratamento de Erros e Async

**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

## 1. Either Pattern
- Sempre usar `EitherOf<Failure, SuccessType>` para operações que podem falhar
- `Resolve(data)` para sucesso
- `Reject(failure)` para erro
- Usar `.get()` para extrair valor:
  ```dart
  result.get(
    (failure) => handleError(failure.message),
    (data) => handleSuccess(data),
  );
  ```

## 2. Async/Await
- Sempre usar `await` em operações assíncronas
- Verificar `mounted` após `await` em widgets:
  ```dart
  await _controller.login(...);
  
  if (!mounted) {
    return;
  }
  
  // Continue with UI updates
  ```

## 3. Feedback de Erro
- **Nunca** exibir erros inline no build
- Sempre usar `ScaffoldMessenger` para erros:
  ```dart
  if (_controller.errorMessage != null) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(content: Text(_controller.errorMessage!)),
      );
    _controller.clearError();
  }
  ```
