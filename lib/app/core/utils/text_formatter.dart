class TextFormatter {
  /// Remove tags HTML <br>, <ul>, <li> e retorna o texto formatado
  /// <br> → quebra de linha dupla
  /// <li> → bullet point (•)
  static String formatHtmlText(String text) {
    String result = text;

    result = result.replaceAll('<ul>', '\n');
    result = result.replaceAll('</ul>', '\n');
    result = result.replaceAll('<li>', '• ');
    result = result.replaceAll('</li>', '\n');
    result = result.replaceAll('<br>', '\n\n');

    result = result.trim();

    return result;
  }

  /// Formata texto de passagens bíblicas, quebrando linha apenas em novos versículos
  /// Ex: <br>2. quebra linha, mas <br> simples apenas adiciona espaço
  static String formatPassageText(String text) {
    // Primeiro substituímos <br> seguido de número e ponto por quebra de linha dupla
    final versiculoPattern = RegExp(
      r'<br>\s*\d+\.',
    ); // Padrão para <br> seguido de número e ponto

    // Encontrar todas as ocorrências do padrão
    final matches = versiculoPattern.allMatches(text);

    // Para cada ocorrência, substituir por quebra de linha dupla + o número do versículo
    String result = text;
    for (final match in matches) {
      final original = match.group(0)!;
      final verseNumber = original.replaceAll('<br>', '').trim();
      result = result.replaceAll(original, '\n\n$verseNumber');
    }

    // Depois substituímos <br> simples por espaço
    result = result.replaceAll('<br>', ' ');

    return result;
  }

  /// Remove todas as tags HTML de um texto
  static String removeHtmlTags(String text) {
    return text.replaceAll(RegExp(r'<[^>]*>'), '');
  }
}
