import 'package:flutter/material.dart';
import 'package:flutter_traducao_com_ia/core/constants/supported_languages.dart';
import 'package:flutter_traducao_com_ia/core/data/translation/translator_repository_impl.dart';
import 'package:flutter_traducao_com_ia/domain/translation/usecases/translate_text_usecase.dart';
import 'package:flutter_traducao_com_ia/presentation/home/viewmodel/home_view_model.dart';
import 'package:flutter_traducao_com_ia/shared/widgets/language_button_widget.dart';
import 'package:flutter_traducao_com_ia/core/data/translation/translator_data_source.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final vm = HomeViewModel(
    TranslateTextUseCase(TranslatorRepositoryImpl(TranslatorDataSource())),
  );

  @override
  void initState() {
    super.initState();
    vm.changeLanguage(SupportedLanguages.pt);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: vm,
      builder: (context, _) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (vm.isLoading)
                  const CircularProgressIndicator()
                else if (vm.error != null)
                  Text(vm.error!, style: const TextStyle(color: Colors.red))
                else
                  Text(vm.title, style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 48),
                Column(
                  children: [
                    LanguageButtonWidget(
                      flagEmoji: '🇧🇷',
                      language: 'Português',
                      onPressed: () => vm.changeLanguage(SupportedLanguages.pt),
                    ),
                    LanguageButtonWidget(
                      flagEmoji: '🇺🇸',
                      language: 'Inglês',
                      onPressed: () => vm.changeLanguage(SupportedLanguages.en),
                    ),
                    LanguageButtonWidget(
                      flagEmoji: '🇪🇸',
                      language: 'Espanhol',
                      onPressed: () => vm.changeLanguage(SupportedLanguages.es),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
