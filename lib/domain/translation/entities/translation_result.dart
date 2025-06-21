/// Entidade que representa o resultado de uma tradução.
///
/// Esta classe encapsula o texto traduzido retornado pelo serviço
/// de tradução. É uma entidade do domínio que não depende de
/// frameworks externos ou detalhes de implementação.
///
/// Seguindo os princípios da Clean Architecture, esta entidade
/// é independente de qualquer framework ou biblioteca externa.
class TranslationResult {
  /// O texto traduzido.
  final String translatedText;

  /// Construtor da entidade TranslationResult.
  ///
  /// [translatedText] - O texto que foi traduzido pelo serviço.
  TranslationResult(this.translatedText);
}
