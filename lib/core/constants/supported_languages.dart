/// Definição dos idiomas suportados pela aplicação de tradução.
///
/// Esta classe define os códigos de idioma suportados e fornece
/// métodos para converter esses códigos em objetos TranslateLanguage
/// do Google ML Kit.
///
/// Os idiomas suportados são: Português, Inglês e Espanhol.
library;

import 'package:google_mlkit_translation/google_mlkit_translation.dart';

/// Classe que gerencia os idiomas suportados pela aplicação.
///
/// Fornece constantes para os códigos de idioma e métodos de conversão
/// para integração com o Google ML Kit Translation.
class SupportedLanguages {
  /// Código do idioma português.
  static const pt = 'pt';

  /// Código do idioma inglês.
  static const en = 'en';

  /// Código do idioma espanhol.
  static const es = 'es';

  /// Converte um código de idioma em um objeto TranslateLanguage.
  ///
  /// [code] - Código do idioma (pt, en, es).
  ///
  /// Retorna o objeto TranslateLanguage correspondente.
  ///
  /// Lança uma exceção se o código de idioma não for suportado.
  static TranslateLanguage toTranslateLanguage(String code) {
    switch (code.toLowerCase()) {
      case pt:
        return TranslateLanguage.portuguese;
      case en:
        return TranslateLanguage.english;
      case es:
        return TranslateLanguage.spanish;
      default:
        throw Exception('Unsupported language: $code');
    }
  }
}
