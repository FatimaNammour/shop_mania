import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_mania/app_injection.dart';

import 'package:shop_mania/core/theme.dart';
import 'package:shop_mania/presentation/router/app_router.dart';

void main() {
  AppInitialInjection().setup();
  log(GetIt.instance<Dio>().toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().themeData,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
