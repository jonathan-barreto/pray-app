---
trigger: always_on
---

# Temas e Estilos

**Flutter Version:** 3.35.4  
**Dart Version:** 3.9.2

## 1. Nunca Hardcode Estilos
- **Nunca** usar valores hexadecimais ou RGB diretamente no código
- **Sempre** acessar `Theme.of(context)` diretamente sem armazenar em variáveis intermediárias
- Usar tokens de cor e tipografia diretamente do tema:
  ```dart
  // CORRETO
  Text(
    'Hello',
    style: Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Theme.of(context).colorScheme.primary,
    ),
  )
  
  // EVITAR
  final colorScheme = Theme.of(context).colorScheme; // Evitar variáveis intermediárias
  final textTheme = Theme.of(context).textTheme;
  
  // ERRADO - NUNCA FAZER
  Text(
    'Hello',
    style: TextStyle(
      fontSize: 20, // Hardcoded
      fontWeight: FontWeight.bold, // Hardcoded
      color: Color(0xFF9FB89D), // Hardcoded hex
    ),
  )
  ```

## 2. Paleta de Cores Oficial
- Usar exclusivamente as cores definidas no tema do app:
  - **Primary**: `#9FB89D` - Botões CTA, ícones destacados, acentos principais
  - **OnPrimary**: `#FFFFFF` - Texto/ícones sobre fundos primários
  - **Background**: `#FBF8F0` - Fundo de tela padrão, superfícies de leitura
  - **Surface**: `#FFFFFF` - Cards, modais, containers elevados
  - **TextPrimary**: `#1E1E1E` - Títulos, textos de alta ênfase
  - **TextSecondary**: `#3C3C3C` - Corpo de texto, textos de suporte
  - **TextMuted**: `#7A7A7A` - Rótulos desativados, placeholders

## 3. Tipografia
- Sempre usar os estilos de texto do tema:
  ```dart
  // Títulos
  Text('Título', style: Theme.of(context).textTheme.headlineLarge),
  Text('Subtítulo', style: Theme.of(context).textTheme.titleMedium),
  
  // Corpo de texto
  Text('Texto normal', style: Theme.of(context).textTheme.bodyMedium),
  Text('Texto pequeno', style: Theme.of(context).textTheme.bodySmall),
  ```
- Modificar estilos usando `.copyWith()` em vez de criar novos `TextStyle`

## 4. Espaçamento e Dimensões
- Usar valores consistentes de espaçamento:
  ```dart
  // Espaçamento padrão
  const SizedBox(height: 8), // Pequeno
  const SizedBox(height: 16), // Médio
  const SizedBox(height: 24), // Grande
  
  // Padding padrão
  Padding(
    padding: const EdgeInsets.all(16),
    child: Widget(),
  )
  ```

## 5. Widgets Componentizados
- Widgets filhos devem ser **apresentacionais** (sem lógica de negócio)
- Receber dados via parâmetros
- Emitir eventos via callbacks simples
- Manter lógica no controller/parent

## 6. Design Minimalista
- Preferir designs limpos e modernos
- Evitar sobrecarga visual
- Usar espaço em branco de forma eficaz
- Manter hierarquia visual clara
- Evitar animações excessivas ou desnecessariamente complexas

## 7. Evitar Comentários Desnecessários
- O código deve ser autoexplicativo
- Nomes de variáveis e métodos devem comunicar a intenção
- Usar comentários apenas para explicar "por quê", não "o quê" ou "como"
- Evitar comentários óbvios como `// Botão de login` antes de um botão de login
