import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TranslatorDataSource {
  Future<String> translate(String text, String from, String to) async {
    final sourceLang = _mapLangCode(from);
    final targetLang = _mapLangCode(to);

    final modelManager = OnDeviceTranslatorModelManager();
    if (!await modelManager.isModelDownloaded(sourceLang.bcpCode)) {
      await modelManager.downloadModel(sourceLang.bcpCode);
    }
    if (!await modelManager.isModelDownloaded(targetLang.bcpCode)) {
      await modelManager.downloadModel(targetLang.bcpCode);
    }

    final translator = OnDeviceTranslator(
      sourceLanguage: sourceLang,
      targetLanguage: targetLang,
    );

    final result = await translator.translateText(text);
    translator.close();

    return result;
  }

  TranslateLanguage _mapLangCode(String code) {
    switch (code.toLowerCase()) {
      case 'en':
        return TranslateLanguage.english;
      case 'pt':
        return TranslateLanguage.portuguese;
      case 'es':
        return TranslateLanguage.spanish;
      default:
        throw Exception('Unsupported language: $code');
    }
  }
}
