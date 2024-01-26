abstract class CacheAndApiEvents {}

class CacheEvent extends CacheAndApiEvents {
  final String cachedData;
  CacheEvent({
    required this.cachedData,
  });
}

class ApiEvent extends CacheAndApiEvents {}
