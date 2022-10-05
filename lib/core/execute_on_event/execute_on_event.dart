import 'package:flutter/material.dart';
import 'package:project_test/core/event_bus/event_bus.dart';
import 'package:project_test/core/events/test_event.dart';

class ExecuteOnEvent {
  static void execute({
    required dynamic event,
    required GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey,
  }) {
    if (event is TestEvent) {
      NavigatorKey.navigatorKey.currentState?.pop();
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(event.message),
        ),
      );
    }
  }
}
