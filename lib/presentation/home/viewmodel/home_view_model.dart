import 'package:flutter/material.dart';
import 'package:flutter_traducao_com_ia/domain/translation/usecases/translate_text_usecase.dart';

class HomeViewModel extends ChangeNotifier {
  final TranslateTextUseCase _translateUseCase;

  static const String _baseText = 'Hello World';
  String _title = _baseText;
  String _currentLanguage = 'en';
  bool _isLoading = false;
  String? _error;

  HomeViewModel(this._translateUseCase);

  String get title => _title;
  String get currentLanguage => _currentLanguage;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> changeLanguage(String language) async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _translateUseCase(
        text: _baseText,
        from: 'en',
        to: language,
      );

      _title = result.translatedText;
      _currentLanguage = language;
    } catch (e) {
      _error = 'Erro ao traduzir: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
