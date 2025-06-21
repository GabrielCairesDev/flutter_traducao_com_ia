import 'package:flutter/material.dart';
import 'package:flutter_traducao_com_ia/core/data/translation/translator_data_source.dart';
import 'package:flutter_traducao_com_ia/core/data/translation/translator_repository_impl.dart';
import 'package:flutter_traducao_com_ia/domain/translation/usecases/translate_text_usecase.dart';
import 'package:flutter_traducao_com_ia/myapp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton(() => TranslatorDataSource());
  getIt.registerLazySingleton(() => TranslatorRepositoryImpl(getIt()));
  getIt.registerLazySingleton(() => TranslateTextUseCase(getIt()));
}

void main() {
  setupDependencies();
  runApp(const MyApp());
}
