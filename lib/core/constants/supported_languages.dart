import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class SupportedLanguages {
  static const pt = 'pt';
  static const en = 'en';
  static const es = 'es';

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
