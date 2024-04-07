import 'dart:developer';

import 'package:dio/dio.dart';

class DioController {
  final Dio dio;

  DioController({
    required this.dio,
  });

  Future<String> checkToken({
    required String url,
    bool shouldRefresh = false,
  }) async {
    if (urlWithoutToken.contains(url)) {
      return '';
    } else {
      if (shouldRefresh
          // ||
          // DateTime.now().isAfter(DataHelper.driver!.expireTime)
          ) {
        log("Refresh is needed");
        try {
          // final Response result = await refreshToken(
          // DataHelper.driver!.refreshToken, RequestRoutes.refreshToken);
          // DataHelper.driver!.accessToken = result.data['accessToken'];
          // DataHelper.driver!.expireTime =
          // DateTime.now().add(Duration(seconds: result.data['expireTime']));
          // storageService.setDriver(DataHelper.driver!);
          return "result.data['accessToken']";
        } on DioException {
          return '';
        }
      } else {
        log("else");
        return "DataHelper.driver!.accessToken";
      }
    }
  }

  Future<Response> refreshToken(String refreshToken, String url) async {
    try {
      final result = await dio.post(url, data: '"$refreshToken"');
      return result;
    } catch (e) {
      rethrow;
    }
  }

  List<String> urlWithoutToken = [
    // RequestRoutes.start,
    // RequestRoutes.register,
    // RequestRoutes.getConstants,
    // RequestRoutes.refreshToken,
    // RequestRoutes.city,
    // RequestRoutes.checkCode,
    // RequestRoutes.sendNumber,
  ];
}
