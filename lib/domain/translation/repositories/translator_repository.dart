/// Interface do repositório de tradução.
///
/// Define o contrato para operações de tradução de texto.
/// Esta interface faz parte da camada de domínio e define
/// as operações que podem ser realizadas com traduções.
///
/// Seguindo os princípios da Clean Architecture, esta interface
/// é independente de detalhes de implementação e frameworks externos.
library;

import 'package:flutter_traducao_com_ia/domain/translation/entities/translation_result.dart';

/// Interface abstrata para operações de tradução.
///
/// Define o contrato que deve ser implementado por qualquer
/// repositório de tradução na aplicação.
abstract class TranslatorRepository {
  /// Traduz um texto de um idioma para outro.
  ///
  /// [text] - O texto a ser traduzido.
  /// [from] - O código do idioma de origem (ex: 'pt', 'en', 'es').
  /// [to] - O código do idioma de destino (ex: 'pt', 'en', 'es').
  ///
  /// Retorna um Future que resolve para um TranslationResult
  /// contendo o texto traduzido.
  ///
  /// Pode lançar exceções em caso de erro na tradução.
  Future<TranslationResult> translate(String text, String from, String to);
}
