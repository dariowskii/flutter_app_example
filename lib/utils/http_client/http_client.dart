import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'http_client.g.dart';

@riverpod
Dio httpClient(Ref ref) {
  final client = Dio();
  client.options.connectTimeout = const Duration(seconds: 30);

  return client;
}
