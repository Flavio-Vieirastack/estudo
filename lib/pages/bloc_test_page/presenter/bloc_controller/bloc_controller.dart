import 'package:flutter_getit/flutter_getit.dart';
import 'package:project_test/pages/bloc_test_page/presenter/bloc_controller/bloc_builder.dart';
import 'package:project_test/pages/bloc_test_page/presenter/bloc_controller/bloc_listner.dart';
import 'package:project_test/pages/bloc_test_page/presenter/bloc_controller/bloc_states.dart';
import 'package:project_test/pages/bloc_test_page/domain/usecase/album_usecase.dart';

class BlocController extends FlutteGetItBloc<BlocStates>
    with BlocBuilder, BlocListner {
  final AlbumUsecase _albumUsecase;
  BlocController({
    required AlbumUsecase albumUsecase,
  }) : _albumUsecase = albumUsecase;

  Future<void> getAlbumData() async {
    emit(BlocLoading());
    final data = await _albumUsecase();

    data.fold(
      (l) => emit(
        BlocError(
          message: l.toString(),
        ),
      ),
      (r) => emit(
        BlocSucess(albuns: r),
      ),
    );
  }
}
