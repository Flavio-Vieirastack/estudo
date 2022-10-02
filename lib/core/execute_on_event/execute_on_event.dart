import 'package:flutter/material.dart';
import 'package:project_test/core/events/test_event.dart';

class ExecuteOnEvent {
  static void execute({
    required dynamic event,
    required GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
  }) {
    if (event is TestEvent) {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(event.message),
        ),
      );
    }
  }
}

