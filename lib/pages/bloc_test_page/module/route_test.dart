import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:project_test/pages/bloc_test_page/data/datasource/album_dtasource.dart';
import 'package:project_test/pages/bloc_test_page/data/repository/album_repository_impl.dart';
import 'package:project_test/pages/bloc_test_page/domain/repository/album_repository.dart';
import 'package:project_test/pages/bloc_test_page/domain/usecase/album_usecase.dart';
import 'package:project_test/pages/bloc_test_page/presenter/page/bloc_page.dart';

import '../presenter/bloc_controller/bloc_controller.dart';

class RouteTest extends FlutterGetItPageRoute {
  const RouteTest({super.key});

  @override
  WidgetBuilder get page => (context) => const BlocPage();

  @override
  List<Dependencie<Object>> get bindings => [
        Dependencie.singleton<Dio>(
          (i) => Dio(),
        ),
        Dependencie.singleton<AlbumDatasource>(
          (i) => AlbumDatasourceImpl(
            dio: i(),
          ),
        ),
        Dependencie.singleton<AlbumRepository>(
          (i) => AlbumRepositoryImpl(
            albumDatasource: i(),
          ),
        ),
        Dependencie.singleton<AlbumUsecase>(
          (i) => AlbumUsecaseImpl(
            albumRepository: i(),
          ),
        ),
        Dependencie.factory<BlocController>(
          (i) => BlocController(
            albumUsecase: i(),
          ),
        ),
      ];
}
