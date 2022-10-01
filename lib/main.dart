import 'package:flutter/material.dart';
import 'package:project_test/core/inject/core_injects.dart';
import 'package:project_test/initial_page.dart';
import 'package:project_test/pages/bloc_test_page/module/route_test.dart';
import 'package:project_test/pages/event_bus_test_page/event_bus_test_page.dart';
import 'package:project_test/pages/event_bus_test_page/event_shot_page.dart';
import 'package:project_test/pages/slivers_test_page/presenter/sliver_page.dart';

void main() async {
  CoreInjects().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InitialPage(),
        '/bloc': (context) => const RouteTest(),
        '/slivers': (context) => const SliverPage(),
        '/event': (context) => const EventBusTestPage(),
        '/event-shot': (context) => const EventShotPage(),
      },
    );
  }
}
