import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_test/core/event_bus/event_bus.dart';

GetIt get getIt => GetIt.instance;
EventBus get eventBus => getIt.get<EventBus>();
GetStorage get getStorage => getIt.get<GetStorage>();
