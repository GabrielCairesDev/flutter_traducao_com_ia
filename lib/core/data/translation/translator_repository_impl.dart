import 'package:flutter_traducao_com_ia/core/data/translation/translator_data_source.dart';
import 'package:flutter_traducao_com_ia/domain/translation/entities/translation_result.dart';
import 'package:flutter_traducao_com_ia/domain/translation/repositories/translator_repository.dart';

class TranslatorRepositoryImpl implements TranslatorRepository {
  final TranslatorDataSource dataSource;

  TranslatorRepositoryImpl(this.dataSource);

  @override
  Future<TranslationResult> translate(
    String text,
    String from,
    String to,
  ) async {
    final result = await dataSource.translate(text, from, to);
    return TranslationResult(result);
  }
}
