/// Configuração de injeção de dependências da aplicação.
///
/// Este módulo utiliza GetIt para gerenciar a injeção de dependências,
/// configurando todas as dependências necessárias para o funcionamento
/// da aplicação seguindo os princípios da Clean Architecture.
///
/// As dependências são registradas como singletons lazy, garantindo
/// que sejam criadas apenas quando necessárias.
library;

import 'package:flutter_traducao_com_ia/core/data/translation/translator_data_source.dart';
import 'package:flutter_traducao_com_ia/core/data/translation/translator_repository_impl.dart';
import 'package:flutter_traducao_com_ia/domain/translation/repositories/translator_repository.dart';
import 'package:flutter_traducao_com_ia/domain/translation/usecases/translate_text_usecase.dart';
import 'package:get_it/get_it.dart';

/// Instância global do GetIt para gerenciamento de dependências.
final getIt = GetIt.instance;

/// Classe responsável por configurar a injeção de dependências.
///
/// Centraliza a configuração de todas as dependências da aplicação,
/// garantindo que as interfaces sejam mapeadas para suas implementações
/// corretas e que as dependências sejam resolvidas adequadamente.
class DependencyInjection {
  /// Configura todas as dependências da aplicação.
  ///
  /// Registra as implementações das interfaces e configura a hierarquia
  /// de dependências seguindo a Clean Architecture:
  /// - Data Layer: TranslatorDataSource
  /// - Domain Layer: TranslatorRepository e TranslateTextUseCase
  static void setup() {
    // Data Layer - Fonte de dados para tradução
    getIt.registerLazySingleton<TranslatorDataSource>(
      () => TranslatorDataSourceImpl(),
    );

    // Domain Layer - Repositório e caso de uso
    getIt.registerLazySingleton<TranslatorRepository>(
      () => TranslatorRepositoryImpl(getIt<TranslatorDataSource>()),
    );
    getIt.registerLazySingleton(
      () => TranslateTextUseCase(getIt<TranslatorRepository>()),
    );
  }

  /// Reseta todas as dependências registradas.
  ///
  /// Útil para testes ou quando é necessário limpar o estado
  /// das dependências da aplicação.
  static void reset() {
    getIt.reset();
  }
}
