import 'package:flutter/material.dart';

class CacheAndApiPage extends StatefulWidget {
  const CacheAndApiPage({super.key});

  @override
  State<CacheAndApiPage> createState() => _CacheAndApiPageState();
}

class _CacheAndApiPageState extends State<CacheAndApiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cache and api'),
      ),
      body: Container(),
    );
  }
}
