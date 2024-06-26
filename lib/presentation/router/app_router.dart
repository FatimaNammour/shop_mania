import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shop_mania/business_logic/auth/login/login_bloc.dart';
import 'package:shop_mania/business_logic/auth/register/register_bloc.dart';
import 'package:shop_mania/business_logic/main_home/search/search_bloc.dart';
import 'package:shop_mania/data/repositories/auth_repo.dart';
import 'package:shop_mania/presentation/auth/login_screen.dart';
import 'package:shop_mania/presentation/auth/register_screen.dart';
import 'dart:developer';
import 'package:shop_mania/presentation/auth/splash_screen.dart';
import 'package:shop_mania/presentation/home/main_home.dart';
import 'package:shop_mania/presentation/home/search/search_result_screen.dart';

import '../auth/verification_screen.dart';
import '../home/search/search_screen.dart';

class AppRouter {
  MaterialPageRoute onGenerateRoute(RouteSettings routeSettings) {
    log("routeSettings.name");
    log(routeSettings.name.toString());
    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case "/RegisterScreen":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegisterBloc(
                      authenticationRepository:
                          AuthenticationRepository(dio: GetIt.instance<Dio>())),
                  child: const SignUpPage(),
                ));
      case "/LoginScreen":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LoginBloc(
                      authenticationRepository:
                          AuthenticationRepository(dio: GetIt.instance<Dio>())),
                  child: const SignInPage(),
                ));
      case "/AuthScreen":
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case "/VerificationCodeScreen":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegisterBloc(
                      authenticationRepository:
                          AuthenticationRepository(dio: GetIt.instance<Dio>())),
                  child: const VerificationCodeScreen(),
                ));

      case "/MainHomeScreen":
        return MaterialPageRoute(builder: (_) => const MainHomeScreen());
      case "/SearchScreen":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SearchBloc(const SearchState()),
                  child: const SearchScreen(),
                ));
      case "/SearchResultScreen":
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SearchBloc(const SearchState()),
                  child: const SearchResultScreen(),
                ));
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
