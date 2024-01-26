import 'package:flutter_getit/flutter_getit.dart';
import 'package:project_test/core/getters/global_getters.dart';
import 'package:project_test/pages/cache_and_api/bloc/cache_example_state.dart';
import 'package:project_test/pages/cache_and_api/data/cache_article_data.dart';

class CacheExempleBloc extends FlutterGetItBloc<CacheExampleState> {
  Future<void> getAlbunsData() async {
    emit(
      CacheExampleStateLoading(),
    );
    final result = await getIt.get<CacheArticleData>().getAlbunsData();
    emit(
      CacheExampleStateSuccess(
        albuns: result,
      ),
    );
  }
}
