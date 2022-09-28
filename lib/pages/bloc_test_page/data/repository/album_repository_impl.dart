import 'dart:developer';

import 'package:project_test/pages/bloc_test_page/data/datasource/album_dtasource.dart';
import 'package:project_test/pages/bloc_test_page/domain/entity/album_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:project_test/pages/bloc_test_page/domain/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDatasource _albumDatasource;
  AlbumRepositoryImpl({
    required AlbumDatasource albumDatasource,
  }) : _albumDatasource = albumDatasource;
  @override
  Future<Either<Exception, List<AlbumEntity>>> call() async {
    try {
      final result = await _albumDatasource();
      return Right(result);
    } catch (e, s) {
      log('Erro', error: e, stackTrace: s);
      return Left(Exception('Erro ao buscar albuns'));
    }
  }
}
