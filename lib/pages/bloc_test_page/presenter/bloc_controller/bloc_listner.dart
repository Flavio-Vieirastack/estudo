import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:project_test/pages/bloc_test_page/presenter/bloc_controller/bloc_states.dart';

abstract class BlocListner implements BlocStateListener<BlocStates> {
  @override
  void buildListenableWidgets({required event, BuildContext? context}) {
    if (event is BlocSucess) {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            'Dados carregados com sucesso',
          ),
        ),
      );
    }
  }
}
