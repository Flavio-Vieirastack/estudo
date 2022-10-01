import 'package:flutter/material.dart';

class EventBusTestPage extends StatefulWidget {
  const EventBusTestPage({Key? key}) : super(key: key);

  @override
  State<EventBusTestPage> createState() => _EventBusTestPageState();
}

class _EventBusTestPageState extends State<EventBusTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive event'),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 150,
              width: 150,
              color: Colors.red,
              child: const Text('Sem eventos'),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pushNamed('/event-shot'),
            child: const Text('Event shot'),
          )
        ],
      ),
    );
  }
}
