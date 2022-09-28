import 'package:project_test/pages/bloc_test_page/domain/entity/album_entity.dart';

class BlocStates {}

class BlocInitial extends BlocStates {
  
}

class BlocLoading extends BlocStates {}

class BlocError extends BlocStates {
  final String message;
  BlocError({
    required this.message,
  });
}

class BlocSucess extends BlocStates {
  final List<AlbumEntity> albuns;
  BlocSucess({
    required this.albuns,
  });
}
