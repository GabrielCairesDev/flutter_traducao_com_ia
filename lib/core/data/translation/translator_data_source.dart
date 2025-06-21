/// Fonte de dados para tradução usando Google ML Kit.
///
/// Esta camada de dados implementa a tradução usando o Google ML Kit
/// Translation, que permite tradução offline usando modelos de IA
/// baixados localmente no dispositivo.
///
/// A implementação gerencia o download automático dos modelos de idioma
/// necessários e executa a tradução de forma assíncrona.
library;

import 'package:flutter_traducao_com_ia/core/constants/supported_languages.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

/// Interface abstrata para fonte de dados de tradução.
///
/// Define o contrato para operações de tradução na camada de dados,
/// permitindo diferentes implementações (Google ML Kit, APIs externas, etc.).
abstract class TranslatorDataSource {
  /// Traduz um texto usando a fonte de dados implementada.
  ///
  /// [text] - O texto a ser traduzido.
  /// [from] - O código do idioma de origem.
  /// [to] - O código do idioma de destino.
  ///
  /// Retorna um Future que resolve para o texto traduzido.
  Future<String> translate(String text, String from, String to);
}

/// Implementação da fonte de dados usando Google ML Kit Translation.
///
/// Gerencia o download automático de modelos de idioma e executa
/// traduções offline usando IA local.
class TranslatorDataSourceImpl implements TranslatorDataSource {
  @override
  /// Traduz um texto usando Google ML Kit Translation.
  ///
  /// Baixa automaticamente os modelos de idioma necessários se não
  /// estiverem disponíveis e executa a tradução offline.
  ///
  /// [text] - O texto a ser traduzido.
  /// [from] - O código do idioma de origem.
  /// [to] - O código do idioma de destino.
  ///
  /// Retorna um Future que resolve para o texto traduzido.
  ///
  /// Pode lançar exceções em caso de erro no download do modelo ou tradução.
  Future<String> translate(String text, String from, String to) async {
    final sourceLang = SupportedLanguages.toTranslateLanguage(from);
    final targetLang = SupportedLanguages.toTranslateLanguage(to);

    final modelManager = OnDeviceTranslatorModelManager();

    // Verifica e baixa o modelo do idioma de origem se necessário
    if (!await modelManager.isModelDownloaded(sourceLang.bcpCode)) {
      await modelManager.downloadModel(sourceLang.bcpCode);
    }

    // Verifica e baixa o modelo do idioma de destino se necessário
    if (!await modelManager.isModelDownloaded(targetLang.bcpCode)) {
      await modelManager.downloadModel(targetLang.bcpCode);
    }

    // Cria o tradutor com os idiomas especificados
    final translator = OnDeviceTranslator(
      sourceLanguage: sourceLang,
      targetLanguage: targetLang,
    );

    // Executa a tradução e fecha o tradutor
    final result = await translator.translateText(text);
    translator.close();

    return result;
  }
}
