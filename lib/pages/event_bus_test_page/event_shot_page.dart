import 'package:flutter/material.dart';
import 'package:project_test/core/events/test_event.dart';

import '../../core/event_bus/event_helper.dart';

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
          onPressed: () {
            SendEvent<TestEvent>().send(
              TestEvent(message: 'Evento disparado'),
            );
          },
          child: const Text('Disparar evento'),
        ),
      ),
    );
  }
}
