import 'package:flutter_traducao_com_ia/core/constants/app_constants.dart';
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
    _validateInput(text, from, to);
    return repository.translate(text, from, to);
  }

  void _validateInput(String text, String from, String to) {
    if (text.trim().isEmpty) {
      throw ArgumentError(AppConstants.emptyTextError);
    }
    if (from.trim().isEmpty) {
      throw ArgumentError(AppConstants.emptyFromLanguageError);
    }
    if (to.trim().isEmpty) {
      throw ArgumentError(AppConstants.emptyToLanguageError);
    }
    if (from == to) {
      throw ArgumentError(AppConstants.sameLanguageError);
    }
  }
}
