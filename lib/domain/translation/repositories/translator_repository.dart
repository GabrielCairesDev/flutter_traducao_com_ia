import 'package:flutter_traducao_com_ia/domain/translation/entities/translation_result.dart';

abstract class TranslatorRepository {
  Future<TranslationResult> translate(String text, String from, String to);
}
