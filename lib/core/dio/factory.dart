import 'package:dio/dio.dart';
import 'package:shop_mania/core/constant/urls.dart';

import 'request_interceptor.dart';

class DioFactory {
  static Dio dioSetUp() {
    final BaseOptions options = BaseOptions(
      baseUrl: ConstUrls.baseUrl,
      sendTimeout: const Duration(seconds: 3),
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 3),
      contentType: "application/json; charset=UTF-8",
    );
    final Dio dio = Dio(options);
    dio.interceptors.addAll([
      RequestInterceptor(),
    ]);
    return dio;
  }
}
