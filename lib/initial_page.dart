
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main page'),
      ),
      body: ListView(
        children: [
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/bloc'),
              child: const Text('Bloc'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/slivers'),
              child: const Text('Slivers'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/event'),
              child: const Text('Event'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/coffee'),
              child: const Text('Coffee'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/secure'),
              child: const Text('secure'),
            ),
          ),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Digite sua sala',
              labelText: 'Digite sua sala',
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed(
                '/socket',
                arguments: controller.text,
              ),
              child: const Text('Socket'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed(
                '/dynamic_widget',
              ),
              child: const Text('Dynamic-widget'),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).pushNamed(
                '/cache',
              ),
              child: const Text('cache and api'),
            ),
          ),
        ],
      ),
    );
  }
}
