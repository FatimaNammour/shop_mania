import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shop_mania/core/constant/enums.dart';
import 'package:shop_mania/core/constant/request_routes.dart';
import 'package:shop_mania/core/dio/exceptions.dart';
import 'package:shop_mania/data/models/user_model.dart';

class AuthenticationRepository {
  Dio dio;

  AuthenticationRepository({required this.dio});

  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<UserModel?> register({
    required String name,
    required String email,
    required String number,
    required String password,
    required String passwordRepeat,
  }) async {
    try {
      final result = await dio.post(
        RequestRoutes.register,
        data: {
          "name": name,
          "email": email,
          "number": number,
          "password": password,
          "passwordRepeat": passwordRepeat,
        },
      );
      return UserModel.fromJson(result.data);
    } catch (error) {
      log(error.toString());
      throw ExceptionHandler(error);
    }
  }

  void dispose() => _controller.close();
}
