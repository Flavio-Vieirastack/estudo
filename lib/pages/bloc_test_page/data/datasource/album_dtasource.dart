import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
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
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          queryParameters: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
          showProcessingTime: true,
          showCUrl: true,
          canShowLog: kDebugMode,
          convertFormData: true,
        ),
      );
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
