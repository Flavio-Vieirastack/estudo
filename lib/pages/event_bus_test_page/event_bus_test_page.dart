import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_test/core/event_bus/event_helper.dart';
import 'package:project_test/core/events/test_event.dart';

class EventBusTestPage extends StatefulWidget {
  const EventBusTestPage({Key? key}) : super(key: key);

  @override
  State<EventBusTestPage> createState() => _EventBusTestPageState();
}

class _EventBusTestPageState extends State<EventBusTestPage> {
  String message = 'Sem eventos';
  @override
  void initState() {
    super.initState();
    GetEvent<TestEvent>().get((event) {
      log('Event $event');
      if (mounted) {
        setState(() {
          message = event.message;
        });
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive event'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              color: message == 'Evento disparado' ? Colors.green : Colors.red,
              child: Center(
                child: Text(message),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/event-shot'),
              child: const Text('Event shot'),
            )
          ],
        ),
      ),
    );
  }
}
