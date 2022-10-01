import 'package:flutter/material.dart';

class EventShotPage extends StatelessWidget {
  const EventShotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shot event'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text('Disparar evento'),
        ),
      ),
    );
  }
}
