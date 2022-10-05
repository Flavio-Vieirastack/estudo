import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_test/pages/bloc_test_page/data/model/album_model.dart';
import 'package:project_test/pages/bloc_test_page/domain/entity/album_entity.dart';

abstract class AlbumDatasource {
  Future<Iterable<AlbumEntity>> call();
}

class AlbumDatasourceImpl implements AlbumDatasource {
  final Dio _dio;
  AlbumDatasourceImpl({
    required Dio dio,
  }) : _dio = dio;
  @override
  Future<Iterable<AlbumEntity>> call() async {
    try {
      final result =
          await _dio.get<List>('https://jsonplaceholder.typicode.com/photos');
      final data = result.data?.map((e) => AlbumModel.fromMap(e));
      return data ?? [] as Iterable<AlbumEntity>;
    } catch (e, s) {
      log('Erro', error: e, stackTrace: s);
      throw Exception(
        'Erro ao buscar dados',
      );
    }
  }
}
