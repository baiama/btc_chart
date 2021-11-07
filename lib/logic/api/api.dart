import 'dart:async';

import 'package:dio/dio.dart';

abstract class ApiMap {
  Future<Dio> getClient() async {
    var options = await getOptions();
    var dio = Dio(options);
    return dio;
  }

  FutureOr<BaseOptions> getOptions() => BaseOptions();

  void close(Dio client) {
    client.close();
  }
}
