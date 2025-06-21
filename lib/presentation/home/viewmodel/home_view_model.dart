import 'package:flutter/material.dart';
import 'package:flutter_traducao_com_ia/core/constants/app_constants.dart';
import 'package:flutter_traducao_com_ia/core/data/translation/translator_repository_impl.dart';
import 'package:flutter_traducao_com_ia/domain/translation/usecases/translate_text_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  final TranslateTextUseCase _translateUseCase;

  String _title = AppConstants.baseText;
  String _currentLanguage = AppConstants.defaultLanguage;
  bool _isLoading = false;
  String? _error;

  HomeViewModel(this._translateUseCase);

  String get title => _title;
  String get currentLanguage => _currentLanguage;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> changeLanguage(String language) async {
    debugPrint(
      'Tentando mudar idioma para: $language (atual: $_currentLanguage)',
    );

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

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
