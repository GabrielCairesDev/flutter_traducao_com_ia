import 'package:flutter/material.dart';
import 'package:flutter_traducao_com_ia/core/di/dependency_injection.dart';
import 'package:flutter_traducao_com_ia/myapp.dart';

void main() {
  DependencyInjection.setup();
  runApp(const MyApp());
}
