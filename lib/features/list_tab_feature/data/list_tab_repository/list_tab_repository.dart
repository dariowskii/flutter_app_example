import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sisal/utils/http_client/http_client.dart';

part 'list_tab_repository.g.dart';

@RestApi()
abstract class ListTabRepository {
  factory ListTabRepository(Dio dio, {String baseUrl}) = _ListTabRepository;

  @GET('https://www.gazzetta.it/dynamic-feed/rss/section/Calcio/Serie-A.xml')
  Future<String> getRssFeed();
}

@riverpod
Future<String> rss(Ref ref) {
  final repo = ListTabRepository(ref.watch(httpClientProvider));
  return repo.getRssFeed();
}
