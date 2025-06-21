import 'package:flutter_traducao_com_ia/core/constants/supported_languages.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TranslatorDataSource {
  Future<String> translate(String text, String from, String to) async {
    final sourceLang = SupportedLanguages.toTranslateLanguage(from);
    final targetLang = SupportedLanguages.toTranslateLanguage(to);

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
}
