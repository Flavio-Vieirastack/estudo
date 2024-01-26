import 'package:get_storage/get_storage.dart';
import 'package:project_test/core/event_bus/event_bus.dart';
import 'package:project_test/core/getters/global_getters.dart';
import 'package:project_test/pages/cache_and_api/bloc/cache_exemple_bloc.dart';
import 'package:project_test/pages/cache_and_api/data/cache_article_data.dart';

class CoreInjects {
  static void inject() {
    getIt.registerSingleton(
      EventBus(),
    );
    getIt.registerSingleton(
      GetStorage(),
    );
    getIt.registerSingleton(
      CacheArticleData(),
    );
    getIt.registerFactory(
      () => CacheExempleBloc(),
    );
  }
}
