/// Ponto de entrada principal da aplicação Flutter de tradução com IA.
///
/// Este arquivo inicializa a aplicação configurando a injeção de dependências
/// e executando o widget raiz da aplicação.
///
/// A aplicação utiliza uma arquitetura limpa (Clean Architecture) com
/// separação clara entre camadas de apresentação, domínio e dados.
library;

import 'package:flutter/material.dart';
import 'package:flutter_traducao_com_ia/core/di/dependency_injection.dart';
import 'package:flutter_traducao_com_ia/myapp.dart';

/// Função principal que inicializa a aplicação.
///
/// Configura a injeção de dependências antes de executar o aplicativo,
/// garantindo que todos os serviços necessários estejam disponíveis.
void main() {
  DependencyInjection.setup();
  runApp(const MyApp());
}
