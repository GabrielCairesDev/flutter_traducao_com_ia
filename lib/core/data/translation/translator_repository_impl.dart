/// Implementação do repositório de tradução na camada de dados.
///
/// Esta implementação coordena com a fonte de dados para executar
/// traduções e converter os resultados em entidades do domínio.
///
/// Também inclui tratamento de erros específicos para tradução,
/// encapsulando exceções da fonte de dados em exceções de domínio.
library;

import 'package:flutter_traducao_com_ia/core/data/translation/translator_data_source.dart';
import 'package:flutter_traducao_com_ia/domain/translation/entities/translation_result.dart';
import 'package:flutter_traducao_com_ia/domain/translation/repositories/translator_repository.dart';

/// Implementação concreta do repositório de tradução.
///
/// Coordena a comunicação entre a camada de domínio e a fonte de dados,
/// convertendo resultados e tratando erros apropriadamente.
class TranslatorRepositoryImpl implements TranslatorRepository {
  /// Fonte de dados injetada via construtor.
  final TranslatorDataSource dataSource;

  /// Construtor do repositório.
  ///
  /// [dataSource] - Fonte de dados que será utilizada para tradução.
  TranslatorRepositoryImpl(this.dataSource);

  @override
  /// Traduz um texto usando a fonte de dados e retorna uma entidade do domínio.
  ///
  /// [text] - O texto a ser traduzido.
  /// [from] - O código do idioma de origem.
  /// [to] - O código do idioma de destino.
  ///
  /// Retorna um Future que resolve para um TranslationResult.
  ///
  /// Lança TranslationException em caso de erro na tradução.
  Future<TranslationResult> translate(
    String text,
    String from,
    String to,
  ) async {
    try {
      final result = await dataSource.translate(text, from, to);
      return TranslationResult(result);
    } catch (e) {
      throw TranslationException('Erro na tradução: ${e.toString()}');
    }
  }
}

/// Exceção específica para erros de tradução.
///
/// Encapsula erros que ocorrem durante o processo de tradução,
/// fornecendo mensagens de erro mais específicas e úteis.
class TranslationException implements Exception {
  /// Mensagem de erro descritiva.
  final String message;

  /// Construtor da exceção.
  ///
  /// [message] - Mensagem descritiva do erro.
  TranslationException(this.message);

  @override
  String toString() => message;
}
