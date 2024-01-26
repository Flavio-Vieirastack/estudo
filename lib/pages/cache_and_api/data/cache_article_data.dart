import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:project_test/core/getters/global_getters.dart';
import 'package:project_test/pages/cache_and_api/events/cache_and_api_events.dart';

class CacheArticleData {
  Future<List<AlbunsModel>> getAlbunsData() async {
    try {
      final dio = Dio();
      dio.interceptors.addAll(
        [],
      );
      dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
      final result = await dio.get(
        '/photos',
      );
      final resultList = result.data as List;
      await Future.delayed(
        const Duration(
          milliseconds: 1500,
        ),
      );
      return resultList
          .map(
            (e) => AlbunsModel.fromJson(e),
          )
          .toList();
    } catch (e, s) {
      log(
        'erro',
        error: e,
        stackTrace: s,
      );
      throw Exception();
    }
  }
}

class CacheManagerInterceptor extends Interceptor {
  String? url;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    url = options.path;
    log(url ?? 'Sem url');
    final cachedData = getStorage.read(url!);
    if (cachedData != null) {
      eventBus.send(
        CacheEvent(
          cachedData: cachedData,
        ),
      );
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    eventBus.send(
      ApiEvent(),
    );
    await getStorage.write(
      url!,
      jsonEncode(response.data),
    );
    handler.next(response);
  }
}

class AlbunsModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  AlbunsModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  AlbunsModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['thumbnailUrl'] = thumbnailUrl;
    return data;
  }
}
