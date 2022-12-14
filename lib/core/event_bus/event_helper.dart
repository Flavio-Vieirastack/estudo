import 'dart:developer';

import 'package:flutter_getit/flutter_getit.dart';
import 'package:project_test/core/event_bus/event_bus.dart';

EventBus get eventBus => Injector.get<EventBus>();

class GetEvent<T> {
  void get(Function(T event) executeOnEvent) {
    eventBus.onEvent<T>().listen(
      (event) {
        log('Event captured $event');
        executeOnEvent.call(event);
      },
    );
  }
}

class SendEvent<T> {
  send(T event) {
    log('Event sended $event');
    eventBus.send(event);
  }
}
