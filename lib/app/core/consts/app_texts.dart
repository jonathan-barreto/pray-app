/// Class containing application text constants
class AppTexts {
  /// Message for server errors
  String get serverErrorMessage => 'Ocorreu um erro no servidor. Tente novamente mais tarde.';
  
  /// Message for no connection errors
  String get noConnection => 'Sem conexão com a internet. Verifique sua conexão e tente novamente.';
  
  /// Message for authentication errors
  String get notAuthenticated => 'Não foi possível autenticar. Por favor, faça login novamente.';
  
  /// Message for invalid request errors
  String get invalidRequest => 'Requisição inválida. Verifique os dados e tente novamente.';
  
  /// Message for data parsing errors
  String get parsingError => 'Erro ao processar os dados. Tente novamente.';
  
  /// Message for generic errors
  String get genericError => 'Ocorreu um erro. Tente novamente mais tarde.';
}

/// Singleton instance for Portuguese app texts
AppTexts ptAppText() => AppTexts();
