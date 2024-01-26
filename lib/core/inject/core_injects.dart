import 'package:project_test/core/event_bus/event_bus.dart';
import 'package:project_test/core/getters/global_getters.dart';

class CoreInjects {
  static void inject() {
    getIt.registerSingleton(
      EventBus(),
    );
  }
}
