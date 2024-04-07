import 'dart:async';

import 'package:dio/dio.dart';
import 'package:shop_mania/core/constant/request_routes.dart';
import 'package:shop_mania/data/models/user_model.dart';

class UserRepository {
  Dio dio;
  UserRepository({required this.dio});

  UserModel? _user;

  Future<UserModel?> getUser() async {
    if (_user != null) return _user;
    final result = await dio.get(RequestRoutes.getUser);
    return UserModel.fromJson(result.data);
  }
}
