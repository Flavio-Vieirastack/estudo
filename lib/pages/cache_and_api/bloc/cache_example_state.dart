import 'package:project_test/pages/cache_and_api/data/cache_article_data.dart';

abstract class CacheExampleState {}

class CacheExampleStateLoading extends CacheExampleState {}

class CacheExampleStateSuccess extends CacheExampleState {
  final List<AlbunsModel> albuns;
  CacheExampleStateSuccess({
    required this.albuns,
  });
}

class CacheExampleStateError extends CacheExampleState {}
