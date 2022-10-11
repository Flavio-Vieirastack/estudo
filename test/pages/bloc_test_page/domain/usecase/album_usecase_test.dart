import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:project_test/pages/bloc_test_page/domain/entity/album_entity.dart';
import 'package:project_test/pages/bloc_test_page/domain/repository/album_repository.dart';
import 'package:project_test/pages/bloc_test_page/domain/usecase/album_usecase.dart';

class AlbumRepositoryMock extends Mock implements AlbumRepository {}

class AlbumEntityMock extends Mock implements AlbumEntity {}

void main() {
  late AlbumRepositoryMock albumRepositoryMock;
  late AlbumUsecase albumUsecase;
  late Iterable<AlbumEntityMock> albuns;
  late Exception error;
  setUp(() {
    albumRepositoryMock = AlbumRepositoryMock();
    albumUsecase = AlbumUsecaseImpl(albumRepository: albumRepositoryMock);
    albuns = [AlbumEntityMock()];
    error = Exception();
  });
  test('Deve retornar uma lista de albuns', () async {
    when(
      () => albumRepositoryMock.call(),
    ).thenAnswer((_) async => Right(albuns));
    final sut = await albumUsecase.call();
    expect(sut, Right(albuns));
  });
  test('Deve chamar o repository ao retornar uma lista de albuns', () async {
    when(
      () => albumRepositoryMock.call(),
    ).thenAnswer((_) async => Right(albuns));
    final sut = await albumUsecase.call();
    expect(sut, Right(albuns));
    verify(
      () => albumRepositoryMock.call(),
    ).called(1);
  });
  test('Deve retornar um erro ao buscar albuns', () async {
    when(
      () => albumRepositoryMock.call(),
    ).thenAnswer(
      (_) async => Left(
        error,
      ),
    );
    final sut = albumUsecase;
    expect(await sut.call(), Left(error));
  });
}
