import 'package:flutter/material.dart';
import 'package:project_test/core/event_bus/event_bus.dart';
import 'package:project_test/core/inject/core_injects.dart';
import 'package:project_test/initial_page.dart';
import 'package:project_test/pages/cache_and_api/page/cache_and_api_page.dart';
import 'package:project_test/pages/coffe/coffee_page.dart';
import 'package:project_test/pages/dynamic_widget/dynamic_widget_page.dart';
import 'package:project_test/pages/slivers_test_page/presenter/sliver_page.dart';
import 'package:project_test/pages/socket_test_page/socket_test_page.dart';
import 'package:project_test/pages/testes/secure_storage_teste.dart';

void main() async {
  CoreInjects.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

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
        '/coffee': (context) => const CoffeePage(),
        '/secure': (context) => const SecureStorageTeste(),
        '/socket': (context) => const SocketTestPage(),
        '/dynamic_widget': (context) => const DynamicWidgetPage(),
        '/cache': (context) => const CacheAndApiPage(),
      },
    );
  }
}
