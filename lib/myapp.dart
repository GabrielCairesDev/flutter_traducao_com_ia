/// Widget raiz da aplicação de tradução com IA.
///
/// Este widget configura o MaterialApp e define a tela inicial
/// da aplicação, que é a HomeView.
///
/// A aplicação utiliza Material Design como framework de UI.
library;

import 'package:flutter/material.dart';
import 'package:flutter_traducao_com_ia/presentation/home/view/home_view.dart';

/// Widget principal da aplicação que configura o MaterialApp.
///
/// Define a estrutura básica da aplicação Flutter, incluindo
/// o tema Material Design e a tela inicial.
class MyApp extends StatelessWidget {
  /// Construtor do widget MyApp.
  ///
  /// [key] - Chave opcional para identificação do widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}
