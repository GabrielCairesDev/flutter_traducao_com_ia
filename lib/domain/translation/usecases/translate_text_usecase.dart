import 'package:flutter_traducao_com_ia/domain/translation/entities/translation_result.dart';
import 'package:flutter_traducao_com_ia/domain/translation/repositories/translator_repository.dart';

class TranslateTextUseCase {
  final TranslatorRepository repository;

  TranslateTextUseCase(this.repository);

  Future<TranslationResult> call({
    required String text,
    required String from,
    required String to,
  }) {
    return repository.translate(text, from, to);
  }
}
