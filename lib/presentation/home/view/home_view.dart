import 'package:flutter/material.dart';
import 'package:flutter_traducao_com_ia/core/constants/app_constants.dart';
import 'package:flutter_traducao_com_ia/core/constants/supported_languages.dart';
import 'package:flutter_traducao_com_ia/core/di/dependency_injection.dart';
import 'package:flutter_traducao_com_ia/domain/translation/usecases/translate_text_usecase.dart';
import 'package:flutter_traducao_com_ia/presentation/home/viewmodel/home_view_model.dart';
import 'package:flutter_traducao_com_ia/shared/widgets/language_button_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final HomeViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = HomeViewModel(getIt<TranslateTextUseCase>());
    // Inicializa com tradução para português
    WidgetsBinding.instance.addPostFrameCallback((_) {
      vm.changeLanguage(SupportedLanguages.pt);
    });
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
                  Column(
                    children: [
                      Text(
                        vm.error!,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppConstants.buttonSpacing),
                      TextButton(
                        onPressed: vm.clearError,
                        child: Text(AppConstants.tryAgainText),
                      ),
                    ],
                  )
                else
                  Text(
                    vm.title,
                    style: TextStyle(fontSize: AppConstants.titleFontSize),
                  ),
                const SizedBox(height: AppConstants.mainSpacing),
                Column(
                  children: [
                    LanguageButtonWidget(
                      flagEmoji: '🇧🇷',
                      language: AppConstants.portugueseText,
                      onPressed: () => vm.changeLanguage(SupportedLanguages.pt),
                    ),
                    const SizedBox(height: AppConstants.buttonSpacing),
                    LanguageButtonWidget(
                      flagEmoji: '🇺🇸',
                      language: AppConstants.englishText,
                      onPressed: () => vm.changeLanguage(SupportedLanguages.en),
                    ),
                    const SizedBox(height: AppConstants.buttonSpacing),
                    LanguageButtonWidget(
                      flagEmoji: '🇪🇸',
                      language: AppConstants.spanishText,
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

  @override
  void dispose() {
    // Clean up resources if needed
    super.dispose();
  }
}
