import 'package:flutter/material.dart';
import 'package:project_test/core/event_bus/event_bus.dart';
import 'package:project_test/core/execute_on_event/execute_on_event.dart';
import 'package:project_test/initial_page.dart';
import 'package:project_test/pages/coffe/coffee_page.dart';
import 'package:project_test/pages/event_bus_test_page/event_bus_test_page.dart';
import 'package:project_test/pages/event_bus_test_page/event_shot_page.dart';
import 'package:project_test/pages/slivers_test_page/presenter/sliver_page.dart';
import 'package:project_test/pages/socket_test_page/socket_test_page.dart';
import 'package:project_test/pages/testes/secure_storage_teste.dart';

import 'core/event_bus/event_helper.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
    GetEvent().get(
      (event) => ExecuteOnEvent.execute(
        event: event,
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    );
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Flutter Demo',
      navigatorKey: NavigatorKey.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InitialPage(),
        '/slivers': (context) => const SliverPage(),
        '/event': (context) => const EventBusTestPage(),
        '/event-shot': (context) => const EventShotPage(),
        '/coffee': (context) => const CoffeePage(),
        '/secure': (context) => const SecureStorageTeste(),
        '/socket': (context) => const SocketTestPage(),
      },
    );
  }
}
