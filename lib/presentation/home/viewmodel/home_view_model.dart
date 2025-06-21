import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final String _title = 'Hello World';
  String get title => _title;
}
