import 'package:flutter_getit/flutter_getit.dart';
import 'package:project_test/core/event_bus/event_bus.dart';

class CoreInjects {
  void init() {
    Dependencie.singleton<EventBus>((i) => EventBus(sync: true));
  }
}
