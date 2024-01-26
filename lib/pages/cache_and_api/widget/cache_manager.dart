import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:project_test/core/getters/global_getters.dart';
import 'package:project_test/pages/cache_and_api/events/cache_and_api_events.dart';

class CacheManager extends StatefulWidget {
  final Widget apiComponent;
  final Widget Function(dynamic decodedData)? getCachedComponent;
  const CacheManager({
    Key? key,
    required this.apiComponent,
    this.getCachedComponent,
  }) : super(key: key);

  @override
  State<CacheManager> createState() => _CacheManagerState();
}

class _CacheManagerState extends State<CacheManager> {
  String? decodedData;
  @override
  void initState() {
    super.initState();
    eventBus.onEvent<CacheAndApiEvents>().listen(
      (event) {
        if (event is CacheEvent) {
          decodedData = jsonDecode(
            event.cachedData,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CacheAndApiEvents>(
      stream: eventBus.onEvent<CacheAndApiEvents>(),
      builder: (context, snapshot) {
        final event = snapshot.data;
        if (event is CacheEvent) {
          return widget.getCachedComponent?.call(decodedData) ??
              const SizedBox.shrink();
        } else if (event is ApiEvent) {
          return widget.apiComponent;
        }
        return widget.apiComponent;
      },
    );
  }
}
