import 'package:flutter/material.dart';
import 'package:flutter_traducao_com_ia/presentation/home/viewmodel/home_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final vm = HomeViewModel();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(vm.title)));
  }
}
