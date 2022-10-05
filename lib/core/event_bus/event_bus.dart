import 'dart:async';

import 'package:flutter/material.dart';

class EventBus {
  final StreamController _streamController;

  StreamController get streamController => _streamController;

  EventBus({bool sync = false})
      : _streamController = StreamController.broadcast(sync: sync);

  EventBus.customController(StreamController controller)
      : _streamController = controller;

  Stream<T> onEvent<T>() {
    if (T == dynamic) {
      return streamController.stream as Stream<T>;
    } else {
      return streamController.stream.where((event) => event is T).cast<T>();
    }
  }

  void send(event) {
    streamController.add(event);
  }

  void close() {
    _streamController.close();
  }

  void drain() {
    _streamController.stream.drain();
  }
}

class NavigatorKey {
  static final navigatorKey = GlobalKey<NavigatorState>();
}
