import 'package:flutter/material.dart';
import 'package:flutter_traducao_com_ia/presentation/home/viewmodel/home_view_model.dart';
import 'package:flutter_traducao_com_ia/shared/widgets/language_button_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final vm = HomeViewModel();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(vm.title, style: TextStyle(fontSize: 24)),
            SizedBox(height: 48),
            Column(
              children: [
                LanguageButtonWidget(
                  flagEmoji: '🇧🇷',
                  language: 'Português',
                  onPressed: () => vm.changeLanguage('br'),
                ),
                LanguageButtonWidget(
                  flagEmoji: '🇺🇸',
                  language: 'Inglês',
                  onPressed: () => vm.changeLanguage('us'),
                ),
                LanguageButtonWidget(
                  flagEmoji: '🇪🇸',
                  language: 'Espanhol',
                  onPressed: () => vm.changeLanguage('es'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
