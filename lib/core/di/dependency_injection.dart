import 'package:flutter_traducao_com_ia/core/data/translation/translator_data_source.dart';
import 'package:flutter_traducao_com_ia/core/data/translation/translator_repository_impl.dart';
import 'package:flutter_traducao_com_ia/domain/translation/repositories/translator_repository.dart';
import 'package:flutter_traducao_com_ia/domain/translation/usecases/translate_text_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  static void setup() {
    // Data Layer
    getIt.registerLazySingleton<TranslatorDataSource>(
      () => TranslatorDataSourceImpl(),
    );

    // Domain Layer
    getIt.registerLazySingleton<TranslatorRepository>(
      () => TranslatorRepositoryImpl(getIt<TranslatorDataSource>()),
    );
    getIt.registerLazySingleton(
      () => TranslateTextUseCase(getIt<TranslatorRepository>()),
    );
  }

  static void reset() {
    getIt.reset();
  }
}
