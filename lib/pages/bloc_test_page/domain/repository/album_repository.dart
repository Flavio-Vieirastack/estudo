import 'package:dartz/dartz.dart';
import 'package:project_test/pages/bloc_test_page/domain/entity/album_entity.dart';

abstract class AlbumRepository {
  Future<Either<Exception, List<AlbumEntity>>> call();
}
  