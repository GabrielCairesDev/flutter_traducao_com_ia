/// Caso de uso para tradução de texto.
///
/// Este caso de uso encapsula a lógica de negócio para tradução de texto,
/// incluindo validações de entrada e coordenação com o repositório.
///
/// Seguindo os princípios da Clean Architecture, este caso de uso
/// contém apenas a lógica de negócio, sem dependências de frameworks externos.
library;

import 'package:flutter_traducao_com_ia/core/constants/app_constants.dart';
import 'package:flutter_traducao_com_ia/domain/translation/entities/translation_result.dart';
import 'package:flutter_traducao_com_ia/domain/translation/repositories/translator_repository.dart';

/// Caso de uso responsável por traduzir texto entre idiomas.
///
/// Coordena a validação de entrada e a execução da tradução através
/// do repositório, garantindo que as regras de negócio sejam aplicadas.
class TranslateTextUseCase {
  /// Repositório de tradução injetado via construtor.
  final TranslatorRepository repository;

  /// Construtor do caso de uso.
  ///
  /// [repository] - Repositório de tradução que será utilizado.
  TranslateTextUseCase(this.repository);

  /// Executa a tradução do texto especificado.
  ///
  /// [text] - O texto a ser traduzido.
  /// [from] - O código do idioma de origem.
  /// [to] - O código do idioma de destino.
  ///
  /// Retorna um Future que resolve para um TranslationResult.
  ///
  /// Lança ArgumentError se os parâmetros não passarem na validação.
  Future<TranslationResult> call({
    required String text,
    required String from,
    required String to,
  }) {
    _validateInput(text, from, to);
    return repository.translate(text, from, to);
  }

  /// Valida os parâmetros de entrada antes da tradução.
  ///
  /// [text] - O texto a ser validado.
  /// [from] - O código do idioma de origem a ser validado.
  /// [to] - O código do idioma de destino a ser validado.
  ///
  /// Lança ArgumentError se qualquer validação falhar.
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
