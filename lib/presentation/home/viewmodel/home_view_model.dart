/// ViewModel da tela principal da aplicação de tradução.
///
/// Gerencia o estado da interface do usuário e coordena as operações
/// de tradução através do caso de uso. Implementa o padrão MVVM
/// (Model-View-ViewModel) para separar a lógica de apresentação
/// da interface do usuário.
///
/// Utiliza ChangeNotifier para notificar mudanças de estado à View.
library;

import 'package:flutter/material.dart';
import 'package:flutter_traducao_com_ia/core/constants/app_constants.dart';
import 'package:flutter_traducao_com_ia/core/data/translation/translator_repository_impl.dart';
import 'package:flutter_traducao_com_ia/domain/translation/usecases/translate_text_usecase.dart';

/// ViewModel responsável por gerenciar o estado da tela principal.
///
/// Coordena as operações de tradução, gerencia o estado de carregamento
/// e tratamento de erros, e notifica a View sobre mudanças de estado.
class HomeViewModel extends ChangeNotifier {
  /// Caso de uso para tradução injetado via construtor.
  final TranslateTextUseCase _translateUseCase;

  /// Texto atual exibido na interface.
  String _title = AppConstants.baseText;

  /// Idioma atual selecionado.
  String _currentLanguage = AppConstants.defaultLanguage;

  /// Indica se uma tradução está em andamento.
  bool _isLoading = false;

  /// Mensagem de erro atual, se houver.
  String? _error;

  /// Construtor do ViewModel.
  ///
  /// [translateUseCase] - Caso de uso para tradução.
  HomeViewModel(this._translateUseCase);

  /// Getter para o texto atual.
  String get title => _title;

  /// Getter para o idioma atual.
  String get currentLanguage => _currentLanguage;

  /// Getter para o estado de carregamento.
  bool get isLoading => _isLoading;

  /// Getter para a mensagem de erro atual.
  String? get error => _error;

  /// Altera o idioma do texto exibido.
  ///
  /// Traduz o texto base para o idioma especificado ou retorna
  /// ao texto original se o idioma selecionado for inglês.
  ///
  /// [language] - Código do idioma para o qual traduzir (pt, en, es).
  ///
  /// Gerencia automaticamente o estado de carregamento e tratamento
  /// de erros durante a operação de tradução.
  Future<void> changeLanguage(String language) async {
    debugPrint(
      'Tentando mudar idioma para: $language (atual: $_currentLanguage)',
    );

    // Evita múltiplas traduções simultâneas
    if (_isLoading) {
      debugPrint('Já está carregando, ignorando...');
      return;
    }

    // Se o idioma selecionado é inglês, volta ao texto original
    if (language == AppConstants.defaultLanguage) {
      debugPrint('Mudando para inglês - voltando ao texto original');
      _title = AppConstants.baseText;
      _currentLanguage = language;
      notifyListeners();
      return;
    }

    // Se o idioma selecionado é o mesmo que o atual, não faz nada
    if (_currentLanguage == language) {
      debugPrint('Mesmo idioma, ignorando...');
      return;
    }

    debugPrint('Iniciando tradução...');
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _translateUseCase(
        text: AppConstants.baseText,
        from: AppConstants.defaultLanguage,
        to: language,
      );

      debugPrint('Tradução concluída: ${result.translatedText}');
      _title = result.translatedText;
      _currentLanguage = language;
    } on ArgumentError catch (e) {
      debugPrint('Erro de validação: ${e.message}');
      _error = '${AppConstants.validationErrorPrefix}${e.message}';
    } on TranslationException catch (e) {
      debugPrint('Erro na tradução: ${e.message}');
      _error = '${AppConstants.translationErrorPrefix}${e.message}';
    } catch (e) {
      debugPrint('Erro inesperado: ${e.toString()}');
      _error = '${AppConstants.unexpectedErrorPrefix}${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Limpa a mensagem de erro atual.
  ///
  /// Remove qualquer erro exibido na interface e notifica
  /// os listeners sobre a mudança de estado.
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
