/// Constantes globais da aplicação de tradução com IA.
///
/// Esta classe centraliza todas as constantes utilizadas na aplicação,
/// incluindo textos, configurações de UI, mensagens de erro e textos de botões.
///
/// Organizar as constantes em uma única classe facilita a manutenção
/// e garante consistência em toda a aplicação.
class AppConstants {
  /// Texto base para demonstração da funcionalidade de tradução.
  static const String baseText = 'Hello World';

  /// Idioma padrão da aplicação.
  static const String defaultLanguage = 'en';

  /// Tamanho da fonte para títulos na interface.
  static const double titleFontSize = 24.0;

  /// Espaçamento entre botões na interface.
  static const double buttonSpacing = 8.0;

  /// Espaçamento principal usado em layouts.
  static const double mainSpacing = 48.0;

  /// Mensagem de erro para texto vazio.
  static const String emptyTextError = 'Texto não pode estar vazio';

  /// Mensagem de erro para idioma de origem vazio.
  static const String emptyFromLanguageError =
      'Idioma de origem não pode estar vazio';

  /// Mensagem de erro para idioma de destino vazio.
  static const String emptyToLanguageError =
      'Idioma de destino não pode estar vazio';

  /// Mensagem de erro para idiomas iguais.
  static const String sameLanguageError =
      'Idioma de origem e destino não podem ser iguais';

  /// Prefixo para mensagens de erro de validação.
  static const String validationErrorPrefix = 'Erro de validação: ';

  /// Prefixo para mensagens de erro de tradução.
  static const String translationErrorPrefix = 'Erro na tradução: ';

  /// Prefixo para mensagens de erro inesperado.
  static const String unexpectedErrorPrefix = 'Erro inesperado: ';

  /// Texto do botão para tentar novamente.
  static const String tryAgainText = 'Tentar novamente';

  /// Texto do botão para idioma português.
  static const String portugueseText = 'Português';

  /// Texto do botão para idioma inglês.
  static const String englishText = 'Inglês';

  /// Texto do botão para idioma espanhol.
  static const String spanishText = 'Espanhol';
}
