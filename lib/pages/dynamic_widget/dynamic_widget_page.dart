import 'package:flutter/material.dart';

class DynamicWidgetPage extends StatelessWidget {
  const DynamicWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic widget'),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
