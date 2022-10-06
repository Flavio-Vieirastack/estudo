import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main page'),
      ),
      body: Column(
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
        ],
      ),
    );
  }
}
