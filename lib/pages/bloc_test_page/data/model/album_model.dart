import 'dart:convert';

import 'package:project_test/pages/bloc_test_page/domain/entity/album_entity.dart';


class AlbumModel extends AlbumEntity {
  AlbumModel({
    required super.title,
    required super.url,
    required super.tumbailUrl,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'title': title});
    result.addAll({'url': url});
    result.addAll({'tumbailUrl': tumbailUrl});
  
    return result;
  }

  factory AlbumModel.fromMap(Map<String, dynamic> map) {
    return AlbumModel(
      title: map['title'] ?? '',
      url: map['url'] ?? '',
      tumbailUrl: map['thumbnailUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumModel.fromJson(String source) => AlbumModel.fromMap(json.decode(source));
}
