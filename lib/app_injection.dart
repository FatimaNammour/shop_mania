import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:shop_mania/core/dio/factory.dart';

class AppInitialInjection {
  final getIt = GetIt.instance;
  final Dio dio = DioFactory.dioSetUp();

  void setup() {
    getIt.registerSingleton<Dio>(dio);
    //After that you can access your AppModel class from anywhere like this:
    //getIt<Dio>()
  }
}
