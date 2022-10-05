import 'package:dartz/dartz.dart';
import 'package:project_test/pages/bloc_test_page/domain/repository/album_repository.dart';

import '../entity/album_entity.dart';

abstract class AlbumUsecase {
  Future<Either<Exception, Iterable<AlbumEntity>>> call();
}

class AlbumUsecaseImpl implements AlbumUsecase {
  final AlbumRepository _albumRepository;
  AlbumUsecaseImpl({
    required AlbumRepository albumRepository,
  }) : _albumRepository = albumRepository;
  @override
  Future<Either<Exception, Iterable<AlbumEntity>>> call() async {
    return await _albumRepository();
  }
}
