---
trigger: always_on
---

# Checklist de Qualidade

**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

Antes de considerar uma feature completa, verifique:

- [ ] Um conceito por arquivo
- [ ] Nomenclatura consistente (snake_case arquivos, PascalCase classes)
- [ ] Models com `fromJson`, `fromMap`, `toMap`, `toJson`
- [ ] Entities puras (sem serialização)
- [ ] Mappers com métodos `static`
- [ ] Repository interface no domain, implementação no data
- [ ] Try-catch em repositories com `HttpException` e genérico
- [ ] Use cases implementam `Usecase<Return, Params>`
- [ ] Controllers estendem `ChangeNotifier`
- [ ] Pages verificam `mounted` após `await`
- [ ] Erros exibidos via `ScaffoldMessenger`
- [ ] Imports organizados (dart → flutter → third-party → project)
- [ ] Sem imports não utilizados
- [ ] Estilos consumidos do `Theme`
- [ ] Navegação via `GoRouter`
- [ ] DI registrado no `getIt`
- [ ] Dispose de recursos (controllers, listeners)
